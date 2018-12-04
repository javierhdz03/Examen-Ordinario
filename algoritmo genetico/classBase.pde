class Base {
  //Atributos
  char letra;
  int valor;
  //Constructor
  Base() {
    valor = int(random(47, 58));
   // while (valor > 90 && valor < 97) {
    // valor = int(random(48, 57));
 //   }
   if (valor == 47) {
   valor = 32;
    }
  //  if (valor == 64) {
  //    valor = 46;
  //  }
    letra = (char) valor;
  }
  //Métodos
  void showData(){
    print(letra);
  }
}
