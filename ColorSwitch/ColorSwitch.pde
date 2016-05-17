Ball main;
CircleObstacle cO1 = new CircleObstacle();
ColorChanger cC1;
color bottom;
color top;
color left;
color right;

boolean play = true;

public void setup() {
  size(400, 600);
  main = new Ball();
  cC1 = new ColorChanger(300);
}

public void draw() {
  if (play==true) {
    background(0);
    cO1.spin();
    cC1.display();
    
    main.move();
    storeColor();
    main.display();
    
    changeColor();
    
    
    end();
  } else {
    background(100);
  }
}

public void storeColor() {
  //bottom = get(200, int(main.getY()+main.getDiameter()/2));
  top = get(200, int(main.getY()-main.getDiameter()/2));
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

public void end() {
  if (main.getBottom()>600) {
    play=false;
  }
  color myColor = main.colorValue;
  System.out.println(myColor);
  if ((top!=myColor && top!=color(0) && top!=color(255))// || 
      //(bottom!=myColor && bottom!=color(0) && bottom!=color(255)) //|| 
      //(left!=myColor && left!=color(0) && left!=color(255)) //|| 
      //(right!=myColor && right!=color(0) && right!=color(255)) 
      ) {

    play=false;
  }
}



public void changeColor() {
  if (cC1.status() && main.getY() - cC1.getY() < main.getDiameter()/2) {
    main.setColor();
    cC1.destroy();
  }
}