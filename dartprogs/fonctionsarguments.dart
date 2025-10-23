bool estImpaire(int x) {
  return x % 2 != 0;
}

bool estPaire(int x) {
  return x % 2 == 0;
}

// l'argument de la fonction est une variable
void afficher(bool varFonctionTest(int value)) {
  for (int i = 0; i < 10; i++) {
    if (varFonctionTest(i)) {
      //appel de la fonction varfonctionTest en argument
      print(i);
    }
  }
}

void main() {
  print("Nombre impaire");
  afficher(estImpaire);
  print("Nombre paire");
  afficher(estPaire); //fonction fournis en parametre (nom de la fonction)
}
