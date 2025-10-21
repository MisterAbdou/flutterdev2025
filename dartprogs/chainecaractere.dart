void main(List<String> args) {
  terrainDeJeuChainesDeCaractere();
}

void terrainDeJeuChainesDeCaractere() {
  basicStringDeclaration();
  multiLineString();
  concatenationTraditionnelle();
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

//interploation de chaine de caracteres
void concatenationTraditionnelle() {
  final hello = "hello";
  final world = "world !";
  // l'operation + permet de faire la concatenation des chaines de caracteres
  final chainesCombines = hello + ' ' + world;
  print(chainesCombines);
}
