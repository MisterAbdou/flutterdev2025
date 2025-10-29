void main(List<String> args) {
  // creation d'une liste vide
  final List<String> jours = [];

  //Affiche si la liste est vide
  print("la liste est vide :${jours.isEmpty}");

  // ajout des elements dans la liste avec la methode add();
  jours.add("Lundi");
  jours.add("Mardi");
  jours.add("Mercredi");

  // notons la taille  de la liste avec la propriete length
  print(" $jours est de taille:${jours.length}");

  // ajout de plusieurs elements avec la methode addAll()

  jours.addAll(["Jeudi", "Vendredi", "Samedi", "Dimanche"]);

  print("les ${jours.length} jours de la semaine sont :$jours");

  // utilisation des proprietes first et last
  print("${jours.first} -->${jours.last}");

  //methode toList(), shuffle() and join()
  var ordreAleatoire = jours.toList(); // creer une copie de list
  ordreAleatoire.shuffle(); // melanger la liste

  print("Dans un ordre aleatoire :${ordreAleatoire}");
  print("Liste vers Csv :${jours.join(";")}");

  // la methode sort() pour trier la liste
  print("jours non tries ${ordreAleatoire}");

  ordreAleatoire.sort((String str1, String str2) => str1.compareTo(str2));

  print(" jours tries ${ordreAleatoire}");

  // fonction de trie sur des entiers
  var nombres = [13, 4, 15, 6];
  nombres.sort();

  print("Nombres tries: ${nombres}");

  // map permet d'executer des instructions sur chaque element
  var nouveauJours = jours.map((unJour) {
    return unJour.toUpperCase(); // en majuscule
  }).toList(); // pour renvoyer le resultat dans une nouvelle liste

  print("$jours -----> $nouveauJours");

  // reduce permet de combiner les elements de la liste

  //reduction de la somme

  final nombreReels = <double>[10, 2, 45, 0, 5];
  // on calcule la somme
  var somme = nombreReels.reduce((value, element) => value + element);
  // on calcule la moyenne
  var moyenne = nombreReels.reduce(
    (value, element) => value + element / nombreReels.length,
  );
  //calcule le maximum
  var max = nombreReels.reduce(
    (value, element) => value > element ? value : element,
  );
  //on calcule le minimum
  var min = nombreReels.reduce(
    (value, element) => value < element ? value : element,
  );
  print("Tableau --->$nombreReels");
  print("Max:$max -- Min:$min -- Somme: $somme -- Moyenne:$moyenne");

  // parcours avec la methode foreach()
  nombreReels.forEach((element) {
    print(" ${2 * element}");
  });
  print("==============================");
  // parcours avec la methode for in
  for (var nb in nombreReels) {
    print(" ${nb * 12}");
  }
}
