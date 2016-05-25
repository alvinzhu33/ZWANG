public class CircleObstacle {
  private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  color a = color(140,19,251);
  color b = color(255,0,128);
  color c = color(53,226,242);
  color d = color(246,223,14);

  public CircleObstacle() {
    diameter=150;

    x = 200;
    y = 150;
    speed = 0.03;
  }

  public CircleObstacle(float dia, float x, float y, float speed) {
    diameter=dia;

    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  void display() {
    strokeWeight(15);
    strokeCap(SQUARE);
    noFill();
    
    stroke(a);
    arc(0, 0, diameter, diameter, 0, HALF_PI);

    stroke(b);
    arc(0, 0, diameter, diameter, HALF_PI, PI);

    stroke(c);
    arc(0, 0, diameter, diameter, PI, 3*HALF_PI);

    stroke(d);
    arc(0, 0, diameter, diameter, 3*HALF_PI, 2*PI);
  }

  public void spin(){
    pushMatrix();
    translate(x,y);
    rotate(angle);
    angle+=speed;
    
    beginShape();
    display();
    endShape();
    
    popMatrix();
   }
}