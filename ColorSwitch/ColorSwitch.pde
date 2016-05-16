Ball b1;
CircleObstacle c1 = new CircleObstacle();

boolean play = true;

public void setup() {
  size(400, 600);
  b1 = new Ball();
}

public void draw() {
  if (play==true) {
    background(0);
    c1.spin();
    b1.move();
    b1.display();
    end();
  }else{
    background(100);
  }
}

public void mousePressed() {
  if(play==true){
    b1.toggleFalling(false);
  }else{
    play=true;
    setup();
  }
}

public void end() {
  if (b1.getBottom()>600) {
    play=false;
  }
}