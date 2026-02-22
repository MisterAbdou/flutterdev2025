
class Enregistrement {
  String? idEnregistrement;
  String? numOrdreMedecin;
  String? idPatient;
  String? dateEnregistrement;
  String? lieuEnregistrement;
  String? description;

  Enregistrement({
    this.idEnregistrement,
    this.numOrdreMedecin,
    this.idPatient,
    this.dateEnregistrement,
    this.lieuEnregistrement,
    this.description,
  });

  
  factory Enregistrement.fromFirestore(Map<String, dynamic> data, String id) {
    return Enregistrement(
      idEnregistrement: id,
      numOrdreMedecin: data['numOrdreMedecin'],
      idPatient: data['idPatient'],
      dateEnregistrement: data['dateEnregistrement'],
      lieuEnregistrement: data['lieuEnregistrement'],
      description: data['description'],
    );
  }

  // ── Objet → Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'numOrdreMedecin': numOrdreMedecin,
      'idPatient': idPatient,
      'dateEnregistrement': dateEnregistrement,
      'lieuEnregistrement': lieuEnregistrement,
      'description': description,
    };
  }
}
