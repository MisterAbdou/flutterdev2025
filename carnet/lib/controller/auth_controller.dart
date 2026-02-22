import 'dart:io'; // ✅ remplace image_picker
import 'package:carnet/models/user.dart';
import 'package:carnet/services/authentification.dart';
import 'package:flutter/material.dart';

class AuthController {
  final Authentification _auth = Authentification();

  // Controllers inscription patient
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController dateNaissanceController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController motDePasseController = TextEditingController();
  final TextEditingController confirmMotDePasseController =
      TextEditingController();

  // Controllers inscription médecin
  final TextEditingController numOrdreController = TextEditingController();
  final TextEditingController specialiteController = TextEditingController();

  // Controllers connexion
  final TextEditingController emailConnexionController =
      TextEditingController();
  final TextEditingController motDePasseConnexionController =
      TextEditingController();

  String? validerInscriptionPatient() {
    if (nomController.text.trim().isEmpty ||
        prenomController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        motDePasseController.text.isEmpty) {
      return "Veuillez remplir tous les champs obligatoires.";
    }
    if (motDePasseController.text != confirmMotDePasseController.text) {
      return "Les mots de passe ne correspondent pas.";
    }
    if (motDePasseController.text.length < 6) {
      return "Le mot de passe doit contenir au moins 6 caractères.";
    }
    return null;
  }

  Future<UserPatient?> inscrirePatient({File? photo}) async {
    final erreur = validerInscriptionPatient();
    if (erreur != null) throw erreur;

    UserPatient patient = UserPatient(
      nom: nomController.text.trim(),
      prenom: prenomController.text.trim(),
      dateNaissance: dateNaissanceController.text.trim(),
      email: emailController.text.trim(),
    );

    return await _auth.inscrirePatient(
      patient,
      motDePasseController.text,
      photo: photo,
    );
  }

  String? validerInscriptionMedecin() {
    if (nomController.text.trim().isEmpty ||
        prenomController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        numOrdreController.text.trim().isEmpty ||
        motDePasseController.text.isEmpty) {
      return "Veuillez remplir tous les champs obligatoires.";
    }
    if (motDePasseController.text != confirmMotDePasseController.text) {
      return "Les mots de passe ne correspondent pas.";
    }
    if (motDePasseController.text.length < 6) {
      return "Le mot de passe doit contenir au moins 6 caractères.";
    }
    return null;
  }

  Future<UserMedecin?> inscrireMedecin({File? photo}) async {
    final erreur = validerInscriptionMedecin();
    if (erreur != null) throw erreur;

    UserMedecin medecin = UserMedecin(
      nom: nomController.text.trim(),
      prenom: prenomController.text.trim(),
      email: emailController.text.trim(),
      numOrdreMedecin: numOrdreController.text.trim(),
      specialite: specialiteController.text.trim(),
    );

    return await _auth.inscrireMedecin(
      medecin,
      motDePasseController.text,
      photo: photo,
    );
  }

  Future<Map<String, dynamic>> connecter() async {
    if (emailConnexionController.text.trim().isEmpty ||
        motDePasseConnexionController.text.isEmpty) {
      throw "Veuillez entrer votre email et mot de passe.";
    }
    return await _auth.connecter(
      emailConnexionController.text.trim(),
      motDePasseConnexionController.text,
    );
  }

  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    dateNaissanceController.dispose();
    emailController.dispose();
    motDePasseController.dispose();
    confirmMotDePasseController.dispose();
    numOrdreController.dispose();
    specialiteController.dispose();
    emailConnexionController.dispose();
    motDePasseConnexionController.dispose();
  }
}
