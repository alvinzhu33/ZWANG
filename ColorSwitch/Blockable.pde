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
  
  public abstract void display();
  public abstract void spin();
  
  public Blockable(){
    diameter=150;

    x = 200;
    y = 150;
    speed = 0.02;
    clockwise=true;
  }
  public Blockable(float y){
    this.y=y;
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
  public float getY() {
    return y;
  }
  public void destroy() {
    exist=false;
  }
}