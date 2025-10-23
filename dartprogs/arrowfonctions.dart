// les fonctions fleches  {return expr;}   peut etre remplacer par => expr;

//------------------------------------------------
//fonction ajout classique
int ajouter(int a, int b) {
  return a + b;
}

// version arrow: fonction fleches
int ajouterArrow(int a, int b) => a + b;

//-----------------------------------------------------
// blocs a une instruction sous format normal
void disBonjour() {
  print(" Dis bonjour");
}

//version Arrow
void disBonjourArrow() => print("Dis bonjour");

//------------------------------------------------
//Fonction avec deux testes lies
bool estMajeur(int age) {
  if (age >= 18) return true;
  return false;
}

//version Arrow avec l'operateur ternaire
bool estMajeurArrow(int age) => age >= 18 ? true : false;

// Exemple d'appel d'une fonction arrow comme argument d'une fonction

void main(List<String> args) {
  print(ajouter(10, 5));
  disBonjour();
  print(estMajeur(35));
}
