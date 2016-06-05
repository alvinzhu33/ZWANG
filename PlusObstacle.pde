public class PlusObstacle extends Blockable {
 


  float x;

  public PlusObstacle() {
    diameter = (int)(Math.random()*100)+150;
    y = -diameter;
    speed = randomSpeed();
    clockwise= randomOri();

    if (clockwise==true) {
      x = 200 + (int)(Math.random() * (diameter/2-40)) + 40;
    } else {
      x = 200 - (int)(Math.random() * (diameter/2-40)) - 40;
    }
  }
  
  public PlusObstacle(float y, float rad) {
    diameter = rad*2;
    this.y = -diameter+y;
    speed = randomSpeed();
    clockwise= randomOri();

    if (clockwise==true) {
      x = 200 + (int)(Math.random() * (diameter/2-40)) + 40;
    } else {
      x = 200 - (int)(Math.random() * (diameter/2-40)) - 40;
    }
  }

  public PlusObstacle(float dia, float x, float y, float speed, boolean clockwise) {
    super(dia, x, y, speed, clockwise);
  }

  public void display() {
    strokeWeight(16);
    strokeCap(ROUND);
    noFill();
    
    stroke(purple);
    line(0, -8, 0, -diameter/2.);
    stroke(magenta);
    line(8, 0, diameter/2., 0);
    stroke(cyan);
    line(0, 8, 0, diameter/2.);
    stroke(yellow);
    line(-8, 0, -diameter/2., 0);

    noStroke();
    fill(purple);
    triangle(0, 0, -8, -8, 8, -8);
    fill(magenta);
    triangle(0, 0, 8, -8, 8, 8);
    fill(cyan);
    triangle(0, 0, 8, 8, -8, 8);
    fill(yellow);
    triangle(0, 0, -8, 8, -8, -8);
  }

  public void spin() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    if (clockwise) {
      angle+=speed;
    } else {
      angle-=speed;
    }

    beginShape();
    display();
    endShape();

    popMatrix();
  }

  /*public void move(float more) {
   y+=.75 + more;
   }
   
   public float getY() {
   return y;
   }
   
   public boolean status() {
   if (y>600){
   exist=false;
   }
   return exist;
   }
   
   public void destroy() {
   exist=false;
   }*/
}