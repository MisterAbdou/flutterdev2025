// assignation d'une fonction a une variable

int add(int a, int b) => a + b;

//  declaration d'un nouveau type
typedef NouveauTypeFonction = int Function(int a, int b);
void main(List<String> args) {
  //affectation de la fonction add a la variable mavariablefn
  var maVariableFn = add;
  print(' resultat de ma variablefn ${maVariableFn(10, 30)}');
  NouveauTypeFonction maVariableFn2 = add;
  print(' resultat de ma variablefn2 ${maVariableFn2(10, 30)}');
}
