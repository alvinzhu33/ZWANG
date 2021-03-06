public class ColorChanger extends Blockable {

  int type = 2;

  public ColorChanger() {
    super();
  }

  public ColorChanger(float y) {
    /*this.y = y;
     exist = true;*/
    super(y);
  }

  public void display() {
    if (exist) {
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
      }
    }
  }
  public void spin() {
    display();
  }
}