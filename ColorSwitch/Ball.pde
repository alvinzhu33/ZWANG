public class Ball {
  private int r, g, b;
  private float diameter;

  private float y;

  private boolean isFalling;
  private double gravity = 1.75;
  private double upCount = 0;

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
    fill(r, g, b);
    ellipse(200, y, diameter, diameter);
  }

  public double getBottom() {
    return y + diameter/2;
  }
  
  public void setColor(){
    int x = (int)(Math.random()*4);
    if (x == 0){
      r = 140;
      g = 19;
      b = 251;
    }else if (x == 1){
      r = 255; 
      g = 0; 
      b = 128;
    }else if (x == 2){
      r = 53;
      g = 226;
      b = 242;
    }else{
      r = 246;
      g = 223;
      b = 14;
    }
  }
      
      
      
      
     
  
}