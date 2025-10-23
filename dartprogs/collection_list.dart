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
}
