public class BarObstacle extends Blockable {
  public BarObstacle() {
    diameter = 16;
    y = -diameter;
    speed = randomSpeed();
    clockwise= randomOri();
  }
  
  public BarObstacle(float y) {
    diameter = 16;
    this.y = y-diameter;
    speed = randomSpeed();
    clockwise= randomOri();
  }

  public void display() {
    strokeWeight(16);
    strokeCap(SQUARE);
    noFill();

    stroke(magenta);
    line(x-450, y, x-300, y);
    stroke(cyan);
    line(x-300, y, x-150, y);
    stroke(yellow);
    line(x-150, y, x, y);
    stroke(purple);
    line(x, y, x+150, y);
    stroke(magenta);
    line(x+150, y, x+300, y);
    stroke(cyan);
    line(x+300, y, x+450, y);
    stroke(yellow);
    line(x+450, y, x+600, y);
  }

  public void spin() {
    if (clockwise) {
      x+=speed*60;
      if(x > 400){
        clockwise=false;
      }
    } else {
      x-=speed*60;
      if(x < 0){
        clockwise=true;
      }
    }

    display();
  }
}