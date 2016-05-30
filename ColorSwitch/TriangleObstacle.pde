public class TriangleObstacle extends Blockable {
  /*private float diameter;
  private float x, y;
  private float angle = 0;
  private float speed;
  private boolean clockwise;
  private boolean exist=true;*/
  color[] choice = new color[]{purple, magenta, cyan, yellow};
  color[] picker = new color[3];

  public TriangleObstacle() {
    /*diameter=150;
    x = 200;
    y = 150;
    speed = 0.02;
    clockwise=true;*/
    super();
    colorPick();
  }

  public TriangleObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    /*diameter = dia;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise=clockwise;*/
    super(dia, x, y, speed, clockwise);
    colorPick();
  }
  
  private void colorPick(){
    int counter=0;
    while(counter<3){
      int n = (int)(Math.random()*4);
      if(choice[n]!=0){
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
    line(0, -diameter/2., diameter/2., diameter/2.);
    
    stroke(picker[1]);
    line(diameter/2., diameter/2., -diameter/2., diameter/2.);
    
    stroke(picker[2]);
    line(-diameter/2., diameter/2, 0, -diameter/2.);
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