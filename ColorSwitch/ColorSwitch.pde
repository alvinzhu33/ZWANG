import java.util.*;

Ball main;
CircleObstacle cO1;
CircleObstacle cO2;
ColorChanger cC1;
int score;
Star s1;
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
  cO1 = new CircleObstacle(150,200,150,0.02, true);
  cO2 = new CircleObstacle(150,200,-150,0.02, false);
  s1 = new Star(0);
  thingsThatBlock.add(cO1);
  thingsThatBlock.add(cO2);
  thingsThatBlock.add(cC1);
  thingsThatBlock.add(s1);
}

public void draw() {
  if (play==true) {
    background(0);
    cO1.spin();
    cO2.spin();

    main.move();
    cC1.display();
    changeColor();
    s1.display();
    
    storeColor();

    obstacleShift();
    main.display();
    myColor = main.getColor();
    
    fill(255);
    text(score,20,50);
    textSize(26);

    end();
  } else {
    endScreen();
  }
}

public void obstacleShift() {
  if (main.getY()<300) {
    for ( Blockable b : thingsThatBlock ) {
      b.move();
    }
  }
}

public void storeColor() {
  top = get(200, int(main.getY()-main.getDiameter()/2));
  bottom = get(200, int(main.getY()+main.getDiameter()/2));
  left = get(int(200-main.getDiameter()/2), int(main.getY()));
  right = get(int(200+main.getDiameter()/2), int(main.getY()));

  noStroke();
  fill(top);
  ellipse(40, 20, 10, 10);
  fill(bottom);
  ellipse(40, 60, 10, 10);
  fill(left);
  ellipse(20, 40, 10, 10);
  fill(right);
  ellipse(60, 40, 10, 10);
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

public boolean doesCollide(int which) {
  color[] colors = new color[4];
  if (which==0) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(200, int(main.getY()-main.getDiameter()/2) - i));
      //printColor(colors[i]);
    }
  } else if (which==1) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(200, int(main.getY()+main.getDiameter()/2) + i));
      //printColor(colors[i]);
    }
  } else if (which==2) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(int(200 - main.getDiameter()/2) - i, int(main.getY())));
      //printColor(colors[i]);
    }
  } else if (which==3) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(int(200 + main.getDiameter()/2) + i, int(main.getY())));
      //printColor(colors[i]);
    }
  }

  if ( colors[0]!=myColor && colors[0]!=color(0) && colors[0]!=color(255) &&
       colors[1]!=myColor && colors[1]!=color(0) && colors[1]!=color(255) &&
       colors[2]!=myColor && colors[2]!=color(0) && colors[2]!=color(255) &&
       colors[3]!=myColor && colors[3]!=color(0) && colors[0]!=color(255)) {
    System.out.println("COLLIDED COLLIDED COLLIDED COLLIDED");
    return true;
  }
  return false;
}


public void end() {
  if (main.getBottom()>600) {
    play=false;
  }
  //myColor = main.colorValue;
  // System.out.println(myColor);
  if (top!=myColor && top!=color(0)) {
    System.out.println("COLLIDED W");
    printColor(top);
    if (doesCollide(0)) {
      play = false;
      System.out.println("Top prob");
    }
  }
  if (bottom!=myColor && bottom!=color(0)) {
    if (doesCollide(1)) {
      play = false;
      System.out.println("Bot prob");
    }
  }
  /*if (left!=myColor && left!=color(0)) {
    if (doesCollide(2)) {
      play = false;
      System.out.println("Left prob");
    }
  }
  if (right!=myColor && right!=color(0)) {
    if (doesCollide(3)) {
      play = false;
      System.out.println("Right prob");
    }
  }*/
}

public void printColor(color c) {
  System.out.println("(" + red(c) + "," + green(c) + "," + blue(c) + ")" );
}

public void changeColor() {
  if (cC1.status() && ((cC1.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cC1.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
    main.setColor();
    cC1.destroy();
  }
  if (s1.status() && ((s1.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((s1.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
    score++;
    s1.destroy();
  }
}

public void endScreen() {
  score=0;
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("GAME", 200, 250);
  text("OVER", 200, 350);
}