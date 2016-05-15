Ball b1 = new Ball();

boolean play = true;

public void setup() {
  size(400, 600);
}

public void draw() {
  if (play==true) {
    background(0);
    b1.move();
    b1.display();
    end();
  }else{
    background(100);
  }
}

public void mousePressed() {
  b1.toggleFalling(false);
}

public void end() {
  if (b1.getBottom()>600) {
    play=false;
  }
}