float startX=200;
float startY=300;
Ball b1 = new Ball(startX, startY);
double gravity = 2;



  public void setup(){
      size(400,600);
  }

  public void draw(){
      background(0);
      b1.move();
      b1.display();
      
  }

  public void mousePressed(){
      b1.toggleFalling(false);
  }