public class Ball {
  private color colorValue;
  private float diameter;

  private float y;
  public static final float DEFAULT_BALL_DIAMETER = 20;
  private boolean isFalling;
  private double gravity = 1.75;
  private double upCount = 0;

  color purple = color(140,19,251);
  color magenta = color(255,0,128);
  color cyan = color(53,226,242);
  color yellow = color(246,223,14);

  public Ball() {
    setColor();
    diameter=DEFAULT_BALL_DIAMETER;

    y=500;
    isFalling=true;
  }

  public Ball(float dia) {
    setColor();
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
      if (upCount>43) {
        toggleFalling(true);
        upCount=0;
      }
    }
  }

  void display() {
    noStroke();
    fill(colorValue);
    ellipse(200, y, diameter, diameter);
  }

  public float getY(){
    return y;
  }

  public double getBottom() {
    return y + diameter/2;
  }
  
  public float getDiameter(){
    return diameter;
  }
  
  public void setColor(){
    int x = (int)(Math.random()*4);
    if (x == 0 && colorValue!=purple){
      colorValue = purple;
    }else if (x == 1 && colorValue!=magenta){
      colorValue = magenta;
    }else if (x == 2 && colorValue!=cyan){
      colorValue = cyan;
    }else if(x == 3 && colorValue!=yellow){
      colorValue = yellow;
    }else{
      setColor();
    }
  }
      
  public color getColor(){
    return colorValue;
  }
}