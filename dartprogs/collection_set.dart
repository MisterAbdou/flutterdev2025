void main(List<String> args) {
  // creation de l'ensemble vide inference de type
  var unEnsemble = <int>{};
  //utilisation des methodes add et addAll
  unEnsemble.add(1);
  unEnsemble.addAll({9, 12, 5, 2});
  print("unEnsemble:$unEnsemble");

  //creation avec specification du type avec le mot cle set
  Set<int> unAutreEnsemble = {1, 2, 3, 4, 1, 3, 3};

  // les doublons vont etre supprimer meme si on y ajoute
  print(" contenu de l'ensemble sans repetition -->$unAutreEnsemble");

  //test d'inclusion des ensembles
  print("--->1 est dans unEnsemble ${unEnsemble.contains(1)}");
  print("---> 99 est dans unAutreEnsemble ${unAutreEnsemble.contains(99)}");

  // intersection de deux ensemble
  var intersection = unEnsemble.intersection(unAutreEnsemble);
  print(" $unEnsemble et $unAutreEnsemble:$intersection");

  // union de deux ensembles
  var unionEnsemble = unEnsemble.union(unAutreEnsemble);
  print(" $unEnsemble OU $unAutreEnsemble: $unionEnsemble");

  // difference entre deux ensembles
  var differenceEnsemble1 = unEnsemble.difference(unAutreEnsemble);
  var differenceEnsemble2 = unAutreEnsemble.difference(unEnsemble);
  print("difference --> $unEnsemble - $unAutreEnsemble : $differenceEnsemble1");
  print(" difference -->$unAutreEnsemble - $unEnsemble :$differenceEnsemble2");

  // parcourir avec  des iterateurs
  for (var n in unionEnsemble) {
    print(n);
  }
}
