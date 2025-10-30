/*?
     definition d'une classe Note avec trois proprietes
*/

class Note {
  final matiere; //champs matiere
  double note;
  double coefficient;

  // constructeur avec un champs obligatoire et un champ avec une valeur par defaut
  Note({required this.matiere, this.note = 0, this.coefficient = 1});

  //surchage( remplacement ) de la methode toString herite de la clase OBJECT
  @override
  String toString() {
    return "\n $matiere --> $note( coef $coefficient)";
  }

  // methode ecrite avec le style arrow
  bool est_validee() => note >= 10 ? true : false;

  //surchage de l'operateur + Exemple note+2 ,ajout 2 points
  double operator +(double bonus) => this.note += bonus;
}

void main(List<String> args) {
  // instalation d'un objet de la classe note avec des parametres nommes
  // matiere et le parametre note par defaut 0
  Note note = new Note(matiere: "Algebre fondamental");
  //utilisateur d'un setter pour modifier le champ note
  note.note = 18;
  //utilisation de la methode note.String() qui transforme la classe en string
  print("note =$note");

  // utilisation de l'operateur surcharger +
  note + 1;
  print("avec bonus: $note");
  print("\n\n\n");
}
