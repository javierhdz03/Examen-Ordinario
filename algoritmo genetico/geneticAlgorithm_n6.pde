Population miGente;


void setup() {
  size(500, 500);
  miGente = new Population(15,15);
  background(0);
  miGente.showText();
  miGente.createPool("1628511 1719297");
  
}

void draw() {
   background(0);
   miGente.createPool("1628511 1719297") ;
   miGente.showText();

}
