public class SquareObstacle extends Blockable {
  /*private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  private boolean clockwise;
  private boolean exist=true;*/

  public SquareObstacle() {
    /*diameter=150;
    x = 200;
    y = 150;
    speed = 0.02;
    clockwise=true;*/
    super();
  }
  
  public SquareObstacle(float y, float rad) {
    /*diameter=150;
    x = 200;
    y = 150;
    speed = 0.02;
    clockwise=true;*/
    super(y);
    diameter = rad*2;
  }

  public SquareObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    /*diameter = dia;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise=clockwise;*/
    super(dia, x, y, speed, clockwise);
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