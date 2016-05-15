public class Ball {
  private int r, g, b;
  private double diameter;

  private float y;

  private boolean isFalling;
  private double gravity = 1.5;
  private double upCount = 0;

  public Ball() {
    g=255;
    r=255;
    b=255;
    diameter=25;

    y=500;
    isFalling=true;
  }

  public Ball(double dia) {
    g=255;
    r=255;
    b=255;
    diameter=dia;

    y=500;
    isFalling=true;
  }

  public void toggleFalling(boolean flag) {
    isFalling=flag;
    if(isFalling==false){
      upCount=0;
    }
  }

  public void move() {
    if (isFalling) {
      y+=gravity;
    } else {
      y-=gravity*3;
      upCount+=gravity*3;
      if (upCount>50) {
        toggleFalling(true);
        upCount=0;
      }
    }
  }

  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(200, y, 25, 25);
  }

  public double getBottom() {
    return y + diameter/2;
  }
}