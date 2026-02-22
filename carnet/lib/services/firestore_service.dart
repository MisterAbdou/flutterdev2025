import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/information.dart';
import '../models/enregistrement.dart';

class FirestoreService {
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collections
  final CollectionReference _informationsRef = FirebaseFirestore.instance
      .collection('informations');
  final CollectionReference _enregistrementsRef = FirebaseFirestore.instance
      .collection('enregistrements');

  Future<void> sauvegarderInformation(Information info) async {
    if (info.idPatient == null) throw 'idPatient est requis.';

    await _informationsRef
        .doc(info.idPatient)
        .set(info.toFirestore(), SetOptions(merge: true));
  }

  Future<Information?> getInformation(String idPatient) async {
    DocumentSnapshot doc = await _informationsRef.doc(idPatient).get();
    if (!doc.exists) return null;
    return Information.fromFirestore(
      doc.data() as Map<String, dynamic>,
      doc.id,
    );
  }

  Stream<Information?> ecouterInformation(String idPatient) {
    return _informationsRef.doc(idPatient).snapshots().map((doc) {
      if (!doc.exists) return null;
      return Information.fromFirestore(
        doc.data() as Map<String, dynamic>,
        doc.id,
      );
    });
  }

  Future<String> ajouterEnregistrement(Enregistrement enregistrement) async {
    DocumentReference ref = await _enregistrementsRef.add(
      enregistrement.toFirestore(),
    );
    return ref.id;
  }

  Future<List<Enregistrement>> getEnregistrementsPatient(
    String idPatient,
  ) async {
    QuerySnapshot snapshot = await _enregistrementsRef
        .where('idPatient', isEqualTo: idPatient)
        .orderBy('dateEnregistrement', descending: true)
        .get();

    return snapshot.docs
        .map(
          (doc) => Enregistrement.fromFirestore(
            doc.data() as Map<String, dynamic>,
            doc.id,
          ),
        )
        .toList();
  }

  Future<List<Enregistrement>> getEnregistrementsMedecin(
    String numOrdreMedecin,
  ) async {
    QuerySnapshot snapshot = await _enregistrementsRef
        .where('numOrdreMedecin', isEqualTo: numOrdreMedecin)
        .orderBy('dateEnregistrement', descending: true)
        .get();

    return snapshot.docs
        .map(
          (doc) => Enregistrement.fromFirestore(
            doc.data() as Map<String, dynamic>,
            doc.id,
          ),
        )
        .toList();
  }

  Stream<List<Enregistrement>> ecouterEnregistrements(String idPatient) {
    return _enregistrementsRef
        .where('idPatient', isEqualTo: idPatient)
        .orderBy('dateEnregistrement', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Enregistrement.fromFirestore(
                  doc.data() as Map<String, dynamic>,
                  doc.id,
                ),
              )
              .toList(),
        );
  }

  Future<void> supprimerEnregistrement(String idEnregistrement) async {
    await _enregistrementsRef.doc(idEnregistrement).delete();
  }

  Future<void> modifierEnregistrement(Enregistrement enregistrement) async {
    if (enregistrement.idEnregistrement == null) {
      throw 'idEnregistrement est requis pour modifier.';
    }
    await _enregistrementsRef
        .doc(enregistrement.idEnregistrement)
        .update(enregistrement.toFirestore());
  }
}
