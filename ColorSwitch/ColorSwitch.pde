Ball main;
CircleObstacle cO1 = new CircleObstacle();
ColorChanger cC1;
ArrayList<Blockable> thingsThatBlock = new ArrayList<Blockable>();

color myColor;
color bottom;
color top;
color left;
color right;

boolean play = true;

public void setup() {
  size(400, 600);
  main = new Ball();
  cC1 = new ColorChanger(300);
  printColor(main.colorValue);
}

public void draw() {
  if (play==true) {
    background(0);
    cO1.spin();
    cC1.display();

    main.move();
    storeColor();
    obstacleShift();
    main.display();

    changeColor();
    myColor = main.getColor();
    //stroke(255);
    //line(0,0,50,200);

    end();
  } else {
    endScreen();
  }
}

public void obstacleShift(){
  if (main.getY()<200){
      for ( Blockable b : thingsThatBlock ){
        b.move();
      }
    }
}

public void storeColor() {
  //bottom = get(200, int(main.getY()+main.getDiameter()/2));
  top = get(200, int(main.getY()-main.getDiameter()/2));
  fill(top);
  ellipse(20, 20, 40, 40);
  //left = get(int(200-main.getDiameter()/2), int(main.getY()));
  //right = get(int(200+main.getDiameter()/2), int(main.getY()));
}

public void mousePressed() {
  if (play==true) {
    main.toggleFalling(false);
  } else {
    play=true;
    setup();
  }
}

public void keyPressed() {
  if (key == ' ') {
    mousePressed();
  }
}

public boolean doesCollide(color c) {
  myColor = main.colorValue;
  for (int i=0; i<4; i++) {
  }

  return true;
}


public void end() {
  if (main.getBottom()>600) {
    play=false;
  }
  myColor = main.colorValue;
  // System.out.println(myColor);
  if ((top!=myColor && top!=color(0, 0, 0)  && top!=color(255, 255, 255))// || 
    //(bottom!=myColor && bottom!=color(0) && bottom!=color(255)) //|| 
    //(left!=myColor && left!=color(0) && left!=color(255)) //|| 
    //(right!=myColor && right!=color(0) && right!=color(255)) 
    ) {
    System.out.println("COLLIDED W");
    printColor(top);
    //play=false;
  }
}

public void printColor(color c) {
  System.out.println("(" + red(c) + "," + green(c) + "," + blue(c) + ")" );
}

public void changeColor() {
  if (cC1.status() && main.getY() - cC1.getY() < main.getDiameter()/2) {
    main.setColor();
    cC1.destroy();
  }
}

public void endScreen() {
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("GAME", 200, 250);
  text("OVER", 200, 350);
}
