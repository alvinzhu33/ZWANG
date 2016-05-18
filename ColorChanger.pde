public class ColorChanger {
  float y;
  boolean exist;

  public ColorChanger(float y) {
    this.y = y;
    exist = true;
  }

  public void display() {
    noStroke();
    if (exist) {
      fill(255);
    } else {
      fill(0);
    }
    ellipse(200, y, 20, 20);
  }

  public float getY() {
    return y;
  }
  
  public boolean status(){
    return exist;
  }

  public void destroy() {
    if (exist) {
      exist=false;
    }
  }
}