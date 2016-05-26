public class SquareObstacle implements Blockable {
  private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  private boolean clockwise;
  private boolean exist=true;

  color purple= color(140, 19, 251);
  color magenta = color(255, 0, 128);
  color cyan = color(53, 226, 242);
  color yellow = color(246, 223, 14);

  public SquareObstacle() {
    diameter=150;
    x = 200;
    y = 150;
    speed = 0.02;
    clockwise=true;
  }

  public SquareObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    diameter = dia;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise=clockwise;
  }

  public void display() {
    strokeWeight(16);
    strokeCap(SQUARE);
    noFill();

    stroke(purple);
    line(-diameter/2., -diameter/2., diameter/2.+8, -diameter/2.);

    stroke(magenta);
    line(diameter/2., -diameter/2.+8, diameter/2., diameter/2.+8);

    stroke(cyan);
    line(diameter/2.-8, diameter/2., -diameter/2.-8, diameter/2.);

    stroke(yellow);
    line(-diameter/2., diameter/2.+8, -diameter/2., -diameter/2.-8);
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

  public void move(float more) {
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
  }
}