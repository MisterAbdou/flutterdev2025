void main(List<String> args) {
  variableNonNullable();
  variableNullable();
  forceWithAssertion();
}

void variableNonNullable() {
  // les variables non nullables doivent obligatoirement
  // etre initialisees par une valeur differente de nulle

  //Erreur !! ne peut avoir null comme valeur
  // String nom = null;
  // int note = null;
}

void variableNullable() {
  // l'ajout de ? devant le type permet d'autoriser la valeur null
  String? nom = null;
  // l'ajout de ? devant le type permet d'autoriser la valeur null
  int? note;
  note = null; //affectation reussie
  // note = note + 3; interdit
  print("Nom:$nom   Note:$note");

  //avec l'instruction if on evite les cas de nullites
  if (note != null) {
    note = note * 2;
    print(note);
  }

  // l'operateur ?? veut dire note ?? 1 <=> if(note ==null) retrun 1
  note = (note ?? 1) + 13;
  print("Nom:${nom ?? 'Nom inconnu'}   NOTE :$note");
}

void forceWithAssertion() {
  int? nombrePaire = 12; // variable nullable mais initialisee
  int nombreImpaire; // variable non nullable

  // Possible car dart voit l'initialisation
  nombreImpaire = nombrePaire + 1;
  print(nombreImpaire);
  // afffectation null
  nombrePaire = null; // possible car nombrePaire est nullable

  //force cette affectation qui va produire une erreur
  nombrePaire = nombrePaire! + 1;
}

void makeIncrement() {
  int? sommeNumber;
  inscreaseValue(sommeNumber);
}

void inscreaseValue(int? value) {
  value = value ?? 0; // initialisation en cas de valeur nulle
  print(value);
}
