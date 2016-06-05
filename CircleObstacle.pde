public class CircleObstacle extends Blockable {
  
  int type = 1;
  
  public CircleObstacle(){
    super();
  }
  
  public CircleObstacle(float y, float rad){
    super(y);
    diameter = rad*2;
  }

  public CircleObstacle(float dia, float x, float y, float speed, boolean clockwise) {
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