public class Ball {

  private color colorValue;
  private float diameter;

  private float y;
  public static final float DEFAULT_BALL_DIAMETER = 20;
  private boolean natural = true;
  private boolean falling;
  private double gravity = 2.25;//1.75;
  private double antiCount = 0;

  color purple = color(140, 19, 251);
  color magenta = color(255, 0, 128);
  color cyan = color(53, 226, 242);
  color yellow = color(246, 223, 14);

  public Ball() {
    setColor();
    diameter=DEFAULT_BALL_DIAMETER;

    y=500;
    falling=true;
  }

  public Ball(float dia) {
    setColor();
    diameter=dia;

    y=500;
    falling=true;
  }

  public void toggleFalling(boolean flag) {
    falling=flag;
    if (falling==false) {
      antiCount=0;
    }
  }

  // movement of the call 
  public void move() {
    if (natural) {
      if (falling) {
        y+=gravity;
      } else {
        y-=gravity*3;
        antiCount+=gravity*3;
        if (antiCount>38) {
          toggleFalling(true);
          antiCount=0;
        }
      }
    } else {
      if (falling) {
        y-=gravity;
      } else {
        y+=gravity*3;
        antiCount+=gravity*3;
        if (antiCount>38) {
          toggleFalling(true);
          antiCount=0;
        }
      }
    }
  }


  // displays the ball
  void display() {
    noStroke();
    fill(colorValue);
    ellipse(200, y, diameter, diameter);
  }

  public float getY() {
    return y;
  }

  public double getBottom() {
    return y + diameter/2;
  }

  public float getDiameter() {
    return diameter;
  }


  // sets the color of the ball randomly
  public void setColor() {
    int x = (int)(Math.random()*4);
    if (x == 0 && colorValue!=purple) {
      colorValue = purple;
    } else if (x == 1 && colorValue!=magenta) {
      colorValue = magenta;
    } else if (x == 2 && colorValue!=cyan) {
      colorValue = cyan;
    } else if (x == 3 && colorValue!=yellow) {
      colorValue = yellow;
    } else {
      setColor();
    }
  }

  public color getColor() {
    return colorValue;
  }

  public void toggleNatural() {
    if (natural) {
      natural = false;
    } else {
      natural = true;
    }
  }
  
  public boolean getNatural(){
    return natural;
  }
}