void main(List<String> args) {
  //affectation fonction anonyme a une variable pour un appel plus tard
  var somme = (int a, int b) => a + b;

  print(somme(23, 45));

  //definition d'une fonction anonyme comme parametre d'une fonction
  disBonjour(nom: "Mamadou", (String message) {
    print(message);
  });
}

// fonction prenant en parametre une fonction et un string
void disBonjour(void f(String message), {String nom = ""}) {
  f("bonjour $nom soyez le bienvenue");
}
