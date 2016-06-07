public class TriangleObstacle extends Blockable {
  /*private float diameter;
   private float x, y;
   private float angle = 0;
   private float speed;
   private boolean clockwise;
   private boolean exist=true;*/
  color[] choice = new color[]{purple, magenta, cyan, yellow};
  color[] picker = new color[3];

  public TriangleObstacle(color need) {
    /*diameter=150;
     x = 200;
     y = 150;
     speed = 0.02;
     clockwise=true;*/
    super();
    colorPick(need);
    picker[0]=need;
  }

  public TriangleObstacle(color need, float y, float rad) {
    /*diameter=150;
     x = 200;
     y = 150;
     speed = 0.02;
     clockwise=true;*/
    super(y);
    diameter = rad*2;
    colorPick(need);
    picker[0]=need;
  }

  public TriangleObstacle(color need, float dia, float x, float y, float speed, boolean clockwise) {
    /*diameter = dia;
     this.x = x;
     this.y = y;
     this.speed = speed;
     this.clockwise=clockwise;*/
    super(dia, x, y, speed, clockwise);
    colorPick(need);
    picker[0]=need;
  }

  private void colorPick(color need) {
    int counter=1;
    while (counter<3) {
      int n = (int)(Math.random()*4);
      if (choice[n]!=0 && choice[n]!=need) {
        picker[counter]=choice[n];
        counter++;
        choice[n]=0;
      }
    }
  }

  public void display() {
    strokeWeight(16);
    strokeCap(SQUARE);
    noFill();

    stroke(picker[0]);
    //line(0, -diameter/2., diameter/2., diameter/2.);
    line(0, -diameter/2., sin(PI/3)*diameter/2., cos(PI/3)*diameter/2.);

    stroke(picker[1]);
    //line(diameter/2., diameter/2., -diameter/2., diameter/2.);
    line(sin(PI/3)*diameter/2., cos(PI/3)*diameter/2., -sin(PI/3)*diameter/2., cos(PI/3)*diameter/2.);

    stroke(picker[2]);
    //line(-diameter/2., diameter/2, 0, -diameter/2.);
    line(-sin(PI/3)*diameter/2., cos(PI/3)*diameter/2., 0, -diameter/2.);
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
}