public class CircleObstacle extends Blockable {
  /*private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  private boolean clockwise;
  private boolean exist=true;*/
  

  //public CircleObstacle() {
  //  /*diameter=150;

  //  x = 200;
  //  y = 150;
  //  speed = 0.02;
  //  clockwise=true;*/
  //  super();
  //}
  
  public CircleObstacle(){
    this.x= 200;
    this.y = 150;
    diameter = randomRadii();
    speed = randomSpeed();
    clockwise = randomOri();
  }

  public CircleObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    /*diameter=dia;

    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise = clockwise;*/
    super(dia, x, y, speed, clockwise);
  }
  
  

  public void display() {
    strokeWeight(16);
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
}