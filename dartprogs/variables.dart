void main(List<String> args) {
  terrainDeJeuVariables();
}

void terrainDeJeuVariables() {
  typesDeBase();
  variableNonType();
  interpolationDeType();
  variablesImmuables();
}

void typesDeBase() {
  int quatre = 4; // declaration d'un entier
  double pi = 3.14; // declaration  d'un nombre reel
  num unNombre = 1.45e5; // declaration num peut etre un entier ou un double
  bool oui = true; //booleen avec la constante true
  bool non = false; // booleen avec la constante false
  int? nothing; // variable non initialisee valeur par defaut null

  print(quatre);
  print(pi);
  print(unNombre);
  print(oui);
  print(non);
  print(nothing);
}

// type dynamic
void variableNonType() {
  dynamic cameleon = "yahoo!!!"; //  cameleon a commme type chaine
  print(cameleon.runtimeType);
  cameleon = 3.14; // cameleon change de type :double
  print(cameleon.runtimeType);
  cameleon = [1, 2, 3]; // cameleon devient ainsi un tableau
  print(cameleon.runtimeType);
}

// type var
void interpolationDeType() {
  var anInteger = 12; // Dart va deduire un type entier
  var aDouble = 3.14; //Dart va deduire un type double
  var aBoolean = true; //Dart va deduire un type booleen

  print(anInteger.runtimeType);
  print(anInteger);

  print(aDouble.runtimeType);
  print(aDouble);

  print(aBoolean.runtimeType);
  print(aBoolean);

  // aDouble="yahhoo"; affectation impossible
}

// const et final
void variablesImmuables() {
  //declaration avec final et le type explicite (int et double)+ initialisation
  final int immutableInt = 100000;
  final double immutableDouble = 1500.12e10;

  print(immutableInt);
  print(immutableDouble);
  // avec final , la precision du type est optionel
  final interpolatedInteger;
  final interpolatedDouble;
  // l'initialisation se fait une seul fois apres cout
  interpolatedInteger = 12345;
  interpolatedDouble = 1234.45;

  print(interpolatedInteger);
  print(interpolatedDouble);

  //avec const l'initialisation est obligatoire
  const aFullySealedVariable = true;
  print(aFullySealedVariable);
}
