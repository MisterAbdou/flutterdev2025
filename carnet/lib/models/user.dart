class UserPatient {
  String? idUser;
  String? nom;
  String? prenom;
  String? dateNaissance;
  String? certification;
  String? email;
  String? motDePasse;
  String? photo;

  UserPatient({
    this.idUser,
    this.nom,
    this.prenom,
    this.dateNaissance,
    this.certification,
    this.email,
    this.motDePasse,
    this.photo,
  });

  factory UserPatient.fromFirestore(Map<String, dynamic> data, String id) {
    return UserPatient(
      idUser: id,
      nom: data['nom'],
      prenom: data['prenom'],
      dateNaissance: data['dateNaissance'],
      certification: data['certification'],
      email: data['email'],
      photo: data['photo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nom': nom,
      'prenom': prenom,
      'dateNaissance': dateNaissance,
      'certification': certification,
      'email': email,
      'photo': photo,
      'role': 'patient',
    };
  }
}

class UserMedecin {
  String? numOrdreMedecin;
  String? nom;
  String? prenom;
  String? email;
  String? motDePasse;
  String? photo;
  String? specialite;

  UserMedecin({
    this.numOrdreMedecin,
    this.nom,
    this.prenom,
    this.email,
    this.motDePasse,
    this.photo,
    this.specialite,
  });

  factory UserMedecin.fromFirestore(Map<String, dynamic> data, String id) {
    return UserMedecin(
      numOrdreMedecin: data['numOrdreMedecin'] ?? id,
      nom: data['nom'],
      prenom: data['prenom'],
      email: data['email'],
      photo: data['photo'],
      specialite: data['specialite'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'numOrdreMedecin': numOrdreMedecin,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'photo': photo,
      'specialite': specialite,
      'role': 'medecin',
    };
  }
}
