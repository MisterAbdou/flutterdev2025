class Information {
  String? idInfo;
  String? numOrdreMedecin;
  String? idPatient;
  double? taille;
  double? poids;
  String? groupeSanguin;
  String? sexe;
  String? situationFamiliale;
  bool? fumeur;
  int? nbCigarette;

  Information({
    this.idInfo,
    this.numOrdreMedecin,
    this.idPatient,
    this.taille,
    this.poids,
    this.groupeSanguin,
    this.sexe,
    this.situationFamiliale,
    this.fumeur = false,
    this.nbCigarette = 0,
  });

  // ── Firestore → Objet
  factory Information.fromFirestore(Map<String, dynamic> data, String id) {
    return Information(
      idInfo: id,
      numOrdreMedecin: data['numOrdreMedecin'],
      idPatient: data['idPatient'],
      taille: (data['taille'] as num?)?.toDouble(),
      poids: (data['poids'] as num?)?.toDouble(),
      groupeSanguin: data['groupeSanguin'],
      sexe: data['sexe'],
      situationFamiliale: data['situationFamiliale'],
      fumeur: data['fumeur'] ?? false,
      nbCigarette: data['nbCigarette'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'numOrdreMedecin': numOrdreMedecin,
      'idPatient': idPatient,
      'taille': taille,
      'poids': poids,
      'groupeSanguin': groupeSanguin,
      'sexe': sexe,
      'situationFamiliale': situationFamiliale,
      'fumeur': fumeur,
      'nbCigarette': nbCigarette,
    };
  }
}
