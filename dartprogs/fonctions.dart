void main(List<String> args) {
  classicalFonctions();
  optionalParameters();
}

//fonctions classiques
void classicalFonctions() {
  afficheMonNom('Abdou ndiaye');
  afficheMonNom("Ndeye Fatou");
  final sum = add(5, 3);
  print("5 + 3 = $sum");
  print('le factoriel de 10 est :${factoriel(10)}');
}

// fonction avec deux arguments obligatoire de type int
int add(int a, int b) {
  return a + b;
}

//fonction avec arguments de type String obligatoire
void afficheMonNom(String name) {
  print("bonjour $name");
}

//fonction recursive avec un argument obligatoire entier
int factoriel(int number) {
  if (number <= 0) return 1;
  return number * factoriel(number - 1);
}

// fonctions avec parametres optionnels
void optionalParameters() {
  fParametreOptionnels("abdou", 20); // appel avec parametres optionnels
  fParametreOptionnels("Aminata"); // appel avec seulement $name
  fParametreOptionnels();
  //fParametreOptionnels(20);// est invalide car 20 sera affecte a nom

  //les parametres nommes peuvent etre fournies dans n'importe quel ordre

  //parametres salutations seulement fournies
  fParametreNommes(salutation: 'Salutation respectueuses');
  //parametres  nom seulement fournie
  fParametreNommes(nom: 'ndiaye');
  // parametres nom et salutations donnes dans l'orde inverse
  fParametreNommes(nom: 'Diop', salutation: "welcom to the party !");
}

// fonction avec des parametres optionnels []
void fParametreOptionnels([String? nom, int? age]) {
  final vraiNom =
      nom ??
      'inconnu'; // affecte inconnu si le nom n'est pas donnee lors de l'appel de la fonction
  final vraiAge = age ?? 0; // affecte 0 si age n'est pas donne
  print('$vraiNom a $vraiAge annees(s)');
}

// fonctions avec parametres nommmes
// fonctions avec des parametres nommmes {}
void fParametreNommes({String? salutation, String? nom}) {
  final vraiSalutation = salutation ?? "Bonjour";
  final vraiNom = nom ?? "Personne mystere";

  print('$vraiSalutation,$vraiNom');
}
