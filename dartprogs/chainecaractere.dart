void main(List<String> args) {
  terrainDeJeuChainesDeCaractere();
}

void terrainDeJeuChainesDeCaractere() {
  basicStringDeclaration();
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
