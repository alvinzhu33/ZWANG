public class CircleObstacle implements Blockable{
  private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  private boolean clockwise;
  private boolean exist=true;
  
  color purple= color(140,19,251);
  color magenta = color(255,0,128);
  color cyan = color(53,226,242);
  color yellow = color(246,223,14);

  public CircleObstacle() {
    diameter=150;

    x = 200;
    y = 150;
    speed = 0.02;
    clockwise=true;
  }

  public CircleObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    diameter=dia;

    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise = clockwise;
  }

  public void display() {
    strokeWeight(15);
    strokeCap(SQUARE);
    noFill();
    
    stroke(purple);
    arc(0, 0, diameter, diameter, 0, HALF_PI);

    stroke(magenta);
    arc(0, 0, diameter, diameter, HALF_PI, PI);

    stroke(cyan);
    arc(0, 0, diameter, diameter, PI, 3*HALF_PI);

    stroke(yellow);
    arc(0, 0, diameter, diameter, 3*HALF_PI, 2*PI);
  }

  public void spin(){
    pushMatrix();
    translate(x,y);
    rotate(angle);
    if(clockwise){
      angle+=speed; 
    }else{
      angle-=speed;
    }
    
    beginShape();
    display();
    endShape();
    
    popMatrix();
   }
   
   public void move(){
     y+=.75;
   }
   
   public float getY(){
     return y;
   }
   
   public boolean status(){
     return exist;
   }
   
   public void destroy(){
     exist=false;
   }
}