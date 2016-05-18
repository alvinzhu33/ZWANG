public class Ball {
  //private int r, g, b;
  private color colorValue;
  private float diameter;

  private float y;

  private boolean isFalling;
  private double gravity = 1.75;
  private double upCount = 0;

  color a = color(140,19,251);
  color b = color(255,0,128);
  color c = color(53,226,242);
  color d = color(246,223,14);

  public Ball() {
    setColor();
    diameter=20;

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
      if (upCount>50) {
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
    if (x == 0 && colorValue!=0){
      colorValue = a;
    }else if (x == 1 && colorValue!=1){
      colorValue = b;
    }else if (x == 2 && colorValue!=2){
      colorValue = c;
    }else if(x == 3 && colorValue!=3){
      colorValue = d;
    }else{
      setColor();
    }
  }
      

}