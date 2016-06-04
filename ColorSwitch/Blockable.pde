private abstract class Blockable {
  color purple= color(140, 19, 251);
  color magenta = color(255, 0, 128);
  color cyan = color(53, 226, 242);
  color yellow = color(246, 223, 14);

  float diameter;
  float x, y;
  float angle = 0;
  float speed;
  boolean clockwise;
  boolean exist=true;
  int type;

  public abstract void display();
  public abstract void spin();

  public Blockable() {
    diameter=150;
    x= 200;
    y = -diameter;
    diameter = randomRadii();
    speed = randomSpeed();
    clockwise = randomOri();
  }
  public Blockable(float y) {
    this();
    this.y+=y;
  }
  public Blockable(float dia, float x, float y, float speed, boolean clockwise) {
    diameter=dia;

    this.x = x;
    this.y = y;
    this.speed = speed;
    this.clockwise = clockwise;
  }

  public void move(float more) {
    y+=.75 + more;
  }
  public boolean status() {
    if (y>600) {
      exist=false;
    }
    return exist;
  }
  
  public void setY(float newY){
    y = newY;
  }
  
  public float getY() {
    return y;
  }
  public void destroy() {
    exist=false;
  }


  public float randomRadii() {
    return (float)(Math.random() * 75 + 125);
  }

  public float randomSpeed() {
    return (float)(Math.random() * 4 / 100) + 0.01;
  }

  public boolean randomOri() {
    int n = (int)(Math.random()*2);
    return n == 0;
  }
  
  public String toString() {
  return "Blockable with ycor=" + y;
}

  
}