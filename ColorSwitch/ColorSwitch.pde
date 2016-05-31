import java.util.Scanner; //<>//

Ball main;

boolean specialPres = false;
int score;
int highest;
PrintWriter output;
String[] starsString;
int[] stars = new int[1];
ArrayList<Blockable> thingsThatBlock = new ArrayList<Blockable>();
Blockable[] showing = new Blockable[4];

Blockable[] obs;
Blockable[] obstacles = {null, new CircleObstacle()};
Blockable[] powerups = {null, new ColorChanger(), new Star()};
Scanner s;
int numObs;

color myColor;
color bottom;
color top;
color left;
color right;

String status = "start";
String mode = "random";
String statusSave;


// ----------------------------LEVEL BUILDER CODE----------------------------------

//try {
// File inFile = new File("level01");
// s = new Scanner(inFile);
//}
//catch(FileNotFoundException e) {
// System.out.println("Level not created yet");
//}{
//  numObs = sc.next();
//  numSets = sc.next();

//  Blockable[] obs = new Blockable[numObs];

//  int obsCount = 0;
//  for (int set = 0; set < numSets; set++){

//    int xcor = sc.next();
//    int ycor = sc.next();

//    int first = sc.next();
//    if (first != 0){
//      Blockable b1 = obstacles[first];
//      first.y = ycor;
//      obs[obsCount] = b1;
//      obsCount++;
//    }

//    int second = sc.next();
//    if (second != 0){
//      Blockable b2 = powerups[second];
//      second.y = ycor;
//      obs[obsCount] = b2;

//      obsCount++;
//    }
//  }
// }

// ----------------------END OF LEVEL BUILDER CODE---------------------------------

public void setup() {
  size(400, 600);
  main = new Ball();

  starsString = loadStrings("highscore.txt");
  highest = int(starsString[0]);

  //if (mode=="random") {
    showing[0] = new CircleObstacle(randomRadii(), 200, 200, 0.02, true);
    showing[1] = new CircleObstacle(randomRadii(), 200, -100, randomSpeed(), false);
    showing[2] = new SquareObstacle(randomRadii(), 200, -350, randomSpeed(), false);
    showing[3] = new Star(200);
 // }
}

public void generateMore(float ycor) {
  int n = (int)(Math.random()*2 );
  if (!specialPres) {
    if (n==0) {
      showing[3] = new Star(0-ycor);
      specialPres = true;
    } else {
      showing[3] = new ColorChanger(0-ycor);
      specialPres = true;
    }
  }
}

// generates a random diameter
public float randomRadii() {
  return (float)(Math.random() * 75 + 125);
}

// generates a random speed
public float randomSpeed() {
  return (float)(Math.random() * 4 / 100) + 0.01;
}

// generates a random orientation
public boolean randomOri() {
  int n = (int)(Math.random()*2);
  return n == 0;
}

// generates new obstacles
public void generateNewStuff() {
  int n;
  for (int i=0; i<3; i++) {
    if (showing[i].getY()>600) {
      n = (int)(Math.random() * 4);
      float rad = randomRadii();
      if (n == 0) {
        showing[i] = new CircleObstacle(rad, 200, 0-rad, randomSpeed(), randomOri());
        generateMore(rad);
      }
      if (n == 1) {
        showing[i] = new SquareObstacle(rad, 200, 0-rad, randomSpeed(), randomOri());
        generateMore(rad);
      }
      if (n == 2) {
        showing[i] = new PlusObstacle(rad, 100, 0-rad, randomSpeed(), randomOri());
        generateMore(rad);
      }
      if (n == 3) {
        showing[i] = new TriangleObstacle(rad, 200, -rad, randomSpeed(), randomOri());
      }
    }
  }
}

public void draw() {
  if (status == "start") {
    background(0);
    startScreen();
  }
  if (status =="play") {
    
    background(0);
    pauseButton();

    main.move();
 
    if (mode=="random"){
      for (int i=0; i<4; i++) {
        change(showing[i]);
      }
  
      for (int i=0; i<4; i++) {
        showing[i].spin();
      }
         
    }
    if (mode=="challenge"){
      for (Blockable b : obs){
        change(b);
        b.spin();
      }
    }

    storeColor();
    generateNewStuff();

    obstacleShift();
    main.display();
    myColor = main.getColor();

    fill(255);
    text(score, 20, 50);
    text(highest, 380, 50);
    textSize(26);

    end();
  }
  if (status == "pause") {
    pauseScreen();
  }
  if (status == "end") {
    endScreen();
    highest += score;
    String high = "" + highest + "";
    System.out.println(highest);

    System.out.println("PREV HIGHEST SCORE:" + starsString[0]);
    starsString[0] = high;
    System.out.println("HIGHEST SCORE:" + starsString[0]);
    saveStrings("highscore.txt", starsString);
  }
}

public void obstacleShift() {
  if (main.getY()<300) {
    for ( Blockable b : showing ) {
      b.move((300-main.y)/100);
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
  if (status=="play") {
    if (mouseX>=185 && mouseX<=215 && mouseY>=20 && mouseY<=50) {
      statusSave = status;
      status = "pause";
    } else {
      main.toggleFalling(false);
    }
  } else if (status == "pause") {
    if (mouseX>=185 && mouseX<=215 && mouseY>=20 && mouseY<=50) {
      status = statusSave;
    } else {
      status=statusSave;
    }
  } else if (status == "start") {
    status = "play";
    statusSave = "play";
  } else if (status == "end") {
    setup();
    status = statusSave;
  }
}

public void keyPressed() {
  if (key == ' ') {
    if (status == "start") {
      status = "play";
      statusSave = "play";
    } else if (status == "play") {
      main.toggleFalling(false);
    } else if (status == "pause") {
      status = statusSave;
    } else if (status == "end") {
      setup();
      status = statusSave;
    }
  }
  if (key == 'x' && status == "play") {
    statusSave = status;
    status = "pause";
  }
}

public boolean doesCollide(int which) {
  color[] colors = new color[4];
  if (which==0) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(200, int(main.getY()-main.getDiameter()/2) - i));
    }
  } else if (which==1) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(200, int(main.getY()+main.getDiameter()/2) + i));
    }
  } else if (which==2) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(int(200 - main.getDiameter()/2) - i, int(main.getY())));
    }
  } else if (which==3) {
    for (int i=0; i<4; i++) {
      colors[i] = (get(int(200 + main.getDiameter()/2) + i, int(main.getY())));
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
    status="end";
  }
  if (top!=myColor && top!=color(0)) {
    System.out.println("COLLIDED W");
    printColor(top);
    if (doesCollide(0)) {

      status="end";
      System.out.println("Top prob");
    }
  }
  if (bottom!=myColor && bottom!=color(0)) {
    if (doesCollide(1)) {
      status="end";
      System.out.println("Bot prob");
    }
  }
}

public void printColor(color c) {
  System.out.println("(" + red(c) + "," + green(c) + "," + blue(c) + ")" );
}

public void change(Blockable cc) {
  if (cc instanceof ColorChanger) {
    if (cc.status() && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
      main.setColor();
      cc.destroy();
      specialPres=false;
    }
  }
  if (cc instanceof Star) {
    if (cc.status() && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
      score++;
      cc.destroy();
      specialPres=false;
    }
  }
}

public void startScreen() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("ZWANG!!! presents", 200, 200);
  textSize(50);
  text("COLOR SWITCH", 200, 270);

  fill(86, 199, 162);
  rect(150, 325, 100, 50, 10);
  textSize(30);
  fill(0);
  text("PLAY", 200, 360);
}

public void pauseButton() {
  fill(150);
  textSize(20);
  rect(185, 20, 30, 30, 10);
  fill(0);
  text("||", 200, 40);
}

public void pauseScreen() {
  fill(255, 0, 0);
  textSize(20);
  rect(185, 20, 30, 30, 10);
  fill(0);
  text("X", 200, 40);

  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("GAME", 200, 250);
  text("PAUSED", 200, 350);
}

public void endScreen() {
  score=0;
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("GAME", 200, 250);
  text("OVER", 200, 350);
}