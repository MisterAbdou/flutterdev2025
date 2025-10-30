// definition de la classe Parent PERSONNE
import 'dart__poo.dart';

class Personne {
  // definition des proprietes nullables
  String? nom;
  String? numeroTelephone;
  bool? est_marrie;
  int? age;

  // constructeur avec avec parametres simples
  Personne(this.nom, this.numeroTelephone, this.est_marrie, this.age);
  //Surchage (remplacement )  de la methode toString herite de la classe Objets
  @override
  String toString() {
    String str = "-" * 100;
    str +=
        "\n Prenom et nom :$nom."
        "\n Telephone:$numeroTelephone."
        "\n Estmarie:$est_marrie."
        "\n Age:$age.";
    return str;
  }
}

/* 
    // definition de la classe etudiant extends Personne
*/
class Etudiant extends Personne {
  // Ensemble de notes  donc sans repetition (une matiere ne doit pas se repeter)
  Set<Note> notesList =
      {}; // utilise la classe Note pour construire les membres

  // _ permet de definir un membre privee
  final _coteEtudiant = DateTime.now().microsecondsSinceEpoch.toString();

  //contructeur avec un appel du constructeurs du parent
  // initialisation d'une propriete a l'interieur
  Etudiant(String? nom, String? numeroTelephone, bool? estMarie, int age)
    : super(nom, numeroTelephone, estMarie, age) {
    // :super permet d'appeler le constructeur parent
    this.notesList.add(Note(matiere: "mathematique"));
    this.notesList.add(Note(matiere: "informatique"));
    this.notesList.add(Note(matiere: "anglais"));
    this.notesList.add(Note(matiere: "francais"));
  }
  @override
  String toString() {
    return "-" * 100 +
        "\n Code Etudiant :$_coteEtudiant\n" +
        super.toString() + // on appelle le toString du parent Personne
        "\n notes :${notesList.join(":")}\n" +
        "-" * 100;
  }

  // calcul de la moyenne
  double calculMoyenne() {
    double somme = 0.0;
    double coef = 0.0;
    for (var n in notesList) {
      somme = somme + n.note * n.coefficient;
      coef = coef + n.coefficient;
    }
    return somme / coef;
  }

  void SetNote({
    required String matiere,
    required double newnote,
    double coef = 1,
  }) {
    var mat = notesList.where((element) {
      return element.matiere == matiere;
    }).first;
    mat.note = newnote;
    mat.coefficient = coef;
  }
}

void main(List<String> args) {
  //Instanciation de la classe personne avec des parametres positions
  Personne p = new Personne("Mamadou Ndiaye", "+221 77 342 63 79", true, 24);
  //utilisation de la methode Personne.toString() qui transforme la classe string
  print("Affichage d'une personne :\n $p");

  Etudiant etu1 = Etudiant("Adama diop", "+221 76 690 41 68", true, 13);
  etu1.SetNote(matiere: "mathematique", newnote: 14, coef: 4);
  etu1.SetNote(matiere: "informatique", newnote: 15, coef: 4);
  etu1.SetNote(matiere: "anglais", newnote: 12, coef: 2);

  //utilisation de la methode Etudiant.toString() qui transforme la classe en chaine de caractere
  print("\n\n\n\n\n");
  print(etu1);
  print(" Moyenne ${etu1.nom} : ${etu1.calculMoyenne()}");
}
