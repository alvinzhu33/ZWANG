public class PlusObstacle extends Blockable {
  /*private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  private boolean clockwise;
  private boolean exist=true;

  color purple= color(140, 19, 251);
  color magenta = color(255, 0, 128);
  color cyan = color(53, 226, 242);
  color yellow = color(246, 223, 14);*/

  public PlusObstacle() {
    /*diameter=200;
    x = 100;
    y = 150;
    speed = 0.02;
    clockwise=true;*/
    super(200, 100, 150, 0.02, true);
  }

  public PlusObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    /*diameter = dia;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise=clockwise;*/
    super(dia, x, y, speed, clockwise);
  }

  public void display() {
    strokeWeight(16);
    strokeCap(ROUND);
    noFill();
  
    stroke(purple);
    line(0, -8, 0, -diameter/2.);
    stroke(magenta);
    line(8, 0, diameter/2., 0);
    stroke(cyan);
    line(0, 8, 0, diameter/2.);
    stroke(yellow);
    line(-8, 0, -diameter/2., 0);

    noStroke();
    fill(purple);
    triangle(0, 0, -8, -8, 8, -8);
    fill(magenta);
    triangle(0, 0, 8, -8, 8, 8);
    fill(cyan);
    triangle(0, 0, 8, 8, -8, 8);
    fill(yellow);
    triangle(0, 0, -8, 8, -8, -8);
  }

  public void spin() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    if (clockwise) {
      angle+=speed;
    } else {
      angle-=speed;
    }

    beginShape();
    display();
    endShape();

    popMatrix();
  }

  /*public void move(float more) {
     y+=.75 + more;
  }

  public float getY() {
    return y;
  }

  public boolean status() {
    if (y>600){
       exist=false;
     }
    return exist;
  }

  public void destroy() {
    exist=false;
  }*/
}