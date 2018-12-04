class Population {
  DNA [] myPop;
  int ind;
  int genes;
  int numDePadres = 5;
  float probabilidadDeMutacion = 0.4;
  int numeroDeGenesMutados=1;
  Population(int i_, int g_) {
    ind = i_;
    genes = g_;
    myPop = new DNA[ind];
    for (int i = 0; i < ind; i++) {
      myPop[i] = new DNA(genes);
    }
  }
  void showText() {
    for (int i = 0; i < 500/32; i++) {
      myPop[i].showData();
      myPop[i].showText((32*(i+1)));
    }
  }
  
  void showFitness(String target){
    for (int i = 0; i < 500/32; i++) {
      println(myPop[i].calcFitness(target));
    }
  }
  
  void showTextFit(String target) {
    for (int i = 0; i < 500/32; i++) {
      print(myPop[i].calcFitness(target));
      print(", ");
      myPop[i].showData();
      myPop[i].showText((32*(i+1)));
    }
  }
 
  void createPool(String target){
    //Seleccion natural
    String bufferDePoblacion [] = new String [ind];
    
    //selection
    for (int i = 0; i <ind; i++) { 
      String fitness = str(myPop[i].calcFitness(target));
      if(fitness.length()==1){
      fitness = "0" + fitness;
      }
      String adnStr = myPop[i].getADNstring();
      String sorted = fitness + "," + adnStr;
      bufferDePoblacion[i] =  sorted; 
     }
      bufferDePoblacion = sort(bufferDePoblacion);
      
        for (int i = 0; i <ind; i++){
        bufferDePoblacion[i] = bufferDePoblacion[i].substring(3); 
    }
   
    String seleccionados[] = new String [numDePadres];

    int j =0;
    for (int i = ind-numDePadres; i<ind; i++){
      seleccionados[j] = bufferDePoblacion[i];

      j++;
    }
    //sex
    for(int i = 0; i< ind-numDePadres; i++){
    int pivoteAleatoreo= int(random(0,(genes-1))); //escoge indice al azar
    int muestraAleatorea = int(random(0,(numDePadres-1))); // escoge padra al azar
    int muestraAleatorea2 = int(random(0,(numDePadres-1)));
    if (muestraAleatorea==muestraAleatorea2){
      muestraAleatorea2 = int(random(0,(numDePadres-1)));
    }
    char [] adn_caracteres= seleccionados[muestraAleatorea2].toCharArray();
    char [] sample = seleccionados[muestraAleatorea].toCharArray();
    
    for(int k = pivoteAleatoreo; k<genes; k++){
      adn_caracteres[k]=sample[k]; //intercambia caracteres
    }
    bufferDePoblacion[i] = new String (adn_caracteres);
    }

     //numeroDeGenesMutados
     for(int x = 0 ; x<ind; x++){
       float mutation = random(0,1);
       if(mutation<=probabilidadDeMutacion){
         for(int z=0; z<numeroDeGenesMutados; z++){
         Base gen_con_mutacion = new Base();
         int randomLetter = int(random(0,genes));
         char[] mutt = bufferDePoblacion[x].toCharArray();
         mutt[randomLetter]= gen_con_mutacion.letra;
       bufferDePoblacion[x] = new String(mutt);
         }
     }
     }

    //Actualizar Poblacion
    for(int i=0; i<ind;i++){
     char[] genoma = bufferDePoblacion[i].toCharArray(); 
      for(int k = 0; k<genes; k++){  
        myPop[i].myGenes[k].letra = genoma[k];
        }
     }

  }
}
