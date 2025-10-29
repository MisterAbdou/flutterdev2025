// collection avec les maps
void main(List<String> args) {
  // map vide,cle de type string et value de type int
  var superficieRegions = Map<String, int>();
  // initialisation avec des valeurs
  superficieRegions = {"Dakar": 547, "Ziguinchor": 7352, "Saint-louis": 19241};
  // ajout de nouveaux valeurs
  superficieRegions["Diourbel"] = 4824;
  superficieRegions["Tambacounda"] = 42364;
  superficieRegions["Thies"] = 6670;

  print("Superficie des regions du Senegal $superficieRegions");

  //utilisation de foreach sur un map
  print("Meilleur presentation avec foreach()");
  superficieRegions.forEach((String key, int value) {
    print("${key.padRight(15)}--> $value");
  });
  printEmployer();
}

void printEmployer() {
  // cles sont des entiers et les valeurs des maps
  Map employers = {
    200: {
      "nom": "Serigne Abdou ndiaye",
      "service": "informatique",
      "salaire": 40000,
    },
    201: {
      "nom": "Abdoulaye ndiaye",
      "service": "comptabilite",
      "salaire": 950000,
    },
    202: {"nom": "Aminata Sow", "service": "vente", "salaire": 4500000},
  };

  print("-" * 85);
  String headerline = "|" + "ID".padLeft(20) + "|";

  employers[200].keys.forEach((element) {
    headerline += element.toString().padLeft(20) + "|";
  });
  print(headerline);
  print("-" * 85);
  employers.forEach((keyEmployer, dataEmployer) {
    print(
      "|${keyEmployer.toString().padLeft(20)}"
      "|${dataEmployer['nom'].padLeft(20)}"
      "|${dataEmployer['service'].padLeft(20)}"
      "|${dataEmployer['salaire'].toString().padLeft(20)}",
    );
    print("-" * 85);
  });

  print(employers.containsKey(200));
  //  lister toutes les cles
  print(employers.keys);
  // employers.clear()
}
