import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/user.dart';

class Authentification {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final CollectionReference _patientsRef = FirebaseFirestore.instance
      .collection('patients');
  final CollectionReference _medecinsRef = FirebaseFirestore.instance
      .collection('medecins');

  Future<String?> _uploadPhoto(File photo, String uid, String dossier) async {
    try {
      print("📸 Début upload photo uid=$uid dossier=$dossier");
      print("📸 Fichier existe : ${await photo.exists()}");
      print("📸 Taille fichier : ${await photo.length()} bytes");

      final ref = _storage.ref().child('$dossier/$uid.jpg');
      print("📸 Référence Storage : ${ref.fullPath}");

      final task = await ref.putFile(photo);
      print("📸 Upload état : ${task.state}");

      final url = await ref.getDownloadURL();
      print("✅ URL obtenue : $url");

      return url;
    } catch (e) {
      print("❌ Erreur upload photo : $e");
      return null;
    }
  }

  Future<UserPatient?> inscrirePatient(
    UserPatient patient,
    String motDePasse, {
    File? photo,
  }) async {
    try {
      print("👤 Inscription patient : ${patient.email}");
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: patient.email!,
        password: motDePasse,
      );
      patient.idUser = credential.user!.uid;
      print("✅ Auth créé uid : ${patient.idUser}");

      if (photo != null) {
        print("📸 Photo fournie, début upload...");
        patient.photo = await _uploadPhoto(photo, patient.idUser!, 'patients');
        print("📸 Photo URL après upload : ${patient.photo}");
      } else {
        print("⚠️ Pas de photo fournie");
      }

      await _patientsRef.doc(patient.idUser).set(patient.toFirestore());
      print("✅ Patient sauvegardé dans Firestore");
      return patient;
    } on FirebaseAuthException catch (e) {
      throw _gererErreurAuth(e.code);
    }
  }

  Future<UserMedecin?> inscrireMedecin(
    UserMedecin medecin,
    String motDePasse, {
    File? photo,
  }) async {
    try {
      print("👨‍⚕️ Inscription médecin : ${medecin.email}");
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: medecin.email!,
        password: motDePasse,
      );
      String uid = credential.user!.uid;
      print("✅ Auth créé uid : $uid");

      if (photo != null) {
        print("📸 Photo fournie, début upload...");
        medecin.photo = await _uploadPhoto(photo, uid, 'medecins');
        print("📸 Photo URL après upload : ${medecin.photo}");
      } else {
        print("⚠️ Pas de photo fournie — photo sera null dans Firestore");
      }

      await _medecinsRef.doc(uid).set(medecin.toFirestore());
      print("✅ Médecin sauvegardé dans Firestore");
      print("✅ Données sauvegardées : ${medecin.toFirestore()}");
      return medecin;
    } on FirebaseAuthException catch (e) {
      throw _gererErreurAuth(e.code);
    }
  }

  Future<Map<String, dynamic>> connecter(
    String email,
    String motDePasse,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: motDePasse,
      );
      String uid = credential.user!.uid;

      DocumentSnapshot patientDoc = await _patientsRef.doc(uid).get();
      if (patientDoc.exists) {
        UserPatient patient = UserPatient.fromFirestore(
          patientDoc.data() as Map<String, dynamic>,
          uid,
        );
        return {'role': 'patient', 'user': patient};
      }

      DocumentSnapshot medecinDoc = await _medecinsRef.doc(uid).get();
      if (medecinDoc.exists) {
        UserMedecin medecin = UserMedecin.fromFirestore(
          medecinDoc.data() as Map<String, dynamic>,
          uid,
        );
        return {'role': 'medecin', 'user': medecin};
      }

      throw 'Utilisateur introuvable dans la base de données.';
    } on FirebaseAuthException catch (e) {
      throw _gererErreurAuth(e.code);
    }
  }

  Future<void> deconnecter() async => await _auth.signOut();

  User? get utilisateurConnecte => _auth.currentUser;

  Future<void> reinitialiserMotDePasse(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  String _gererErreurAuth(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Cet email est déjà utilisé.';
      case 'invalid-email':
        return 'Email invalide.';
      case 'weak-password':
        return 'Mot de passe trop faible (6 caractères minimum).';
      case 'user-not-found':
        return 'Aucun compte trouvé avec cet email.';
      case 'wrong-password':
        return 'Mot de passe incorrect.';
      case 'too-many-requests':
        return 'Trop de tentatives. Réessayez plus tard.';
      default:
        return 'Erreur : $code';
    }
  }
}
