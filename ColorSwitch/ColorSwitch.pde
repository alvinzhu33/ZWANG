import java.util.*;

Ball main;
Blockable b1, b2, b3;
//CircleObstacle cO1 = new CircleObstacle();
//CircleObstacle cO2;
//ColorChanger cC1;
//SquareObstacle s1 = new SquareObstacle();
PlusObstacle p1 = new PlusObstacle();
int score;
//Star s1;
ArrayList<Blockable> thingsThatBlock = new ArrayList<Blockable>();
Blockable[] showing = new Blockable[5];


color myColor;
color bottom;
color top;
color left;
color right;

boolean play = true;

public void setup() {
  size(400, 600);
  main = new Ball();
  //cC1 = new ColorChanger(300);
  //cO1 = new CircleObstacle(randomRadii(),200,150,0.02, true);
  //cO2 = new CircleObstacle(randomRadii(),200,-150,0.02, false);
  //s1 = new Star(0);

  showing[0] = new CircleObstacle(randomRadii(), 200, 200, 0.02, true);
  showing[1] = new Star(200);
  showing[2] = new ColorChanger(-100);
  showing[3] = new CircleObstacle(randomRadii(), 200, -100, randomSpeed(), false);
  showing[4] = new SquareObstacle(randomRadii(), 200, -300, randomSpeed(), true);

  //  thingsThatBlock.add(cO1);
  //thingsThatBlock.add(cO2);
  //thingsThatBlock.add(cC1);
  //thingsThatBlock.add(s1);
}

public float randomRadii() {
  return (float)(Math.random() * 75 + 125);
}

public float randomSpeed() {
  return (float)(Math.random() * 4 / 100) + 0.01;
}

public boolean randomOri() {
  int n = (int)(Math.random()*2);
  return n == 0;
}

public void generateNewStuff() {
  int n;
  for (int i=0; i<5; i++) {
    if (showing[i].getY()>600 || !showing[i].status()) {
      n = (int)(Math.random() * 5);
      float rad = randomRadii();
      if (n == 0) {
        showing[i] = new CircleObstacle(rad, 200, 0-rad, randomSpeed(), randomOri());
        /*if (showing[3].getY()>600){
         showing[3] = new Star(0-rad);
         }*/
      }
      /*if (n==1) {
       showing[i] = new CircleObstacle(rad, 200, 0-rad, randomSpeed(), false);
       if (showing[4].getY()>600){
       showing[4] = new ColorChanger(0-rad);
       }
       }*/
      if (n == 1) {
        showing[i] = new SquareObstacle(rad, 200, 0-rad, randomSpeed(), randomOri());
      }
      if (n == 2){
        showing[i] = new PlusObstacle(rad, 100, 0-rad, randomSpeed(), randomOri());
      }
      if (n == 3) {
        showing[i] = new Star(-20);
      }
      /*if(n == 4){
       showing[i] = new ColorChanger(-20);
       }*/
    }
  }
  /*if (b1.getY()>400) {
   n = (int)(Math.random() * thingsThatBlock.size());
   showing[0]=thingsThatBlock.get(n);
   }
   if (b2.getY()>400) {
   n = (int)(Math.random() * thingsThatBlock.size());
   showing[1]=thingsThatBlock.get(n);
   }
   if (b3.getY()>400) {
   n = (int)(Math.random() * thingsThatBlock.size());
   b3 = thingsThatBlock.get(n);
   }*/
}

public void draw() {
  if (play==true) {
    background(0);
    //cO1.spin();
    //cO2.spin();
    //s1.spin();
    //p1.spin();

    main.move();
    //cC1.display();
    for (int i=0; i<5; i++) {
      change(showing[i]);
    }
    //s1.display();

    for (int i=0; i<5; i++) {
      //showing[i].move();
      if (main.getY()<300) {
        showing[i].move();
      }
      //showing[i].display();
      showing[i].spin();
    }
    /*b1.display();
     b1.spin();
     
     b2.display();
     b2.spin();
     
     b3.display();
     b3.spin();*/

    storeColor();
    generateNewStuff();

    //obstacleShift();
    main.display();
    myColor = main.getColor();

    fill(255);
    text(score, 20, 50);
    textSize(26);

    end();
  } else {
    endScreen();
  }
}

public void obstacleShift() {
  if (main.getY()<300) {
    for ( Blockable b : showing ) {
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

public void change(Blockable cc) {
  if (cc instanceof ColorChanger) {
    if (cc.status() && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
      main.setColor();
      cc.destroy();
    }
  }
  if (cc instanceof Star) {
    if (cc.status() && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
      score++;
      cc.destroy();
    }
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