public class ColorChanger {
  float y;
  boolean exist;
 color a = color(140,19,251);
  color b = color(255,0,128);
  color c = color(53,226,242);
  color d = color(246,223,14);

  public ColorChanger(float y) {
    this.y = y;
    exist = true;
  }

  public void display() {
    noStroke();
    if (exist) {
      fill(255, 0, 128);
      arc(200, y, 20, 20, 0, HALF_PI);
      
      fill(53, 226, 242);
      arc(200, y, 20, 20, HALF_PI, PI);
      
      fill(246, 223, 14);
      arc(200, y, 20, 20, PI, HALF_PI*3);
      
      fill(140, 19, 251);
      arc(200, y, 20, 20, HALF_PI*3, 2*PI);
    } else {
      fill(0);
    }
  }

  public float getY() {
    return y;
  }

  public boolean status() {
    return exist;
  }

  public void destroy() {
    if (exist) {
      exist=false;
    }
  }
}
