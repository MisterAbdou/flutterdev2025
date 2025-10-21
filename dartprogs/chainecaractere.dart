void main(List<String> args) {
  terrainDeJeuChainesDeCaractere();
}

void terrainDeJeuChainesDeCaractere() {
  basicStringDeclaration();
  multiLineString();
  concatenationTraditionnelle();
  modernInterpolation();
}

void basicStringDeclaration() {
  // quotes simples
  print('Quotes simples');
  //variables avec type chaine de caracteres
  final unePhrase = 'une chaine avec l\'echappement de caractere';
  print(unePhrase);
  // quotes doubles
  print(" bonjour pour les Quotes doubles !");

  final uneAutrePhrase = "Des 'quotes simples' dans des quotes doubles !";
  print(uneAutrePhrase);

  final uneTroisiemePhrase = 'Des "quotes doubles" dans des quotes simples !';
  print(uneTroisiemePhrase);
}

//chaine de caractere multiligne
void multiLineString() {
  final abdouNdiaye = '''
   bonjour tout le monde. je m'appelle Serigne Abdou ndiaye
   actuellement etudiant en licence 3 informatique(si);
   🎇🎇🧨✨🎊🎉🎉🎆 
   ''';
  print(abdouNdiaye);
}

//concatenation des chaines de caracteres: ancien methode(+) et nouvelle methode(interpolation)
void concatenationTraditionnelle() {
  final hello = "hello";
  final world = "world !";
  // l'operation + permet de faire la concatenation des chaines de caracteres
  final chainesCombines = hello + ' ' + world;
  print(chainesCombines);
}

//interpolation des chaines de caracteres
void modernInterpolation() {
  final annee = 2011;
  //le caractere $ permet de donner le nom d'une variable dans une chaine de caracteres
  final interpolated = "Dart a ete cree en $annee";
  print(interpolated);

  final age = 20;
  // avec la combinaison de caracteres ${}
  final howOld = 'je suis ${age >= 18 ? 'Majeur' : 'Mineur'}.';
  print(howOld);
}
