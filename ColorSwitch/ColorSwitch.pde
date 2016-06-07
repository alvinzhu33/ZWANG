import java.util.Scanner; //<>// //<>//
import java.io.*;

// ----game vars---------
Ball main;
color myColor;
color bottom;
color top;
String status = "start";
String mode;
String statusSave;
float yMin;
// ----------------------


// ---- score vars-------
int score;
int highest;
String[] starsString;
// ----------------------


// random mode vars------
boolean isPUPres = false;
Blockable[] showing = new Blockable[4];
Blockable[] showingPows = new Blockable[4];
// ----------------------


//--challenge mode vars---
Blockable[] obs;
Blockable[] obsP;
Blockable[] obstacles = {null, new CircleObstacle(), new SquareObstacle(), new PlusObstacle(), new TriangleObstacle(myColor), new BarObstacle()};
Blockable[] powerups = {null, new ColorChanger(), new Star()};
Scanner s;
int numObs;
int numSets;
// ----------------------


// ----------------------------LEVEL BUILDER CODE----------------------------------

/*private int[][] readConfig(String[] lines ) {
 int lineCount = lines.length;
 
 int[][] configs = new int[lineCount][] ;
 
 for ( int i = 0; i < lineCount; i++ )
 {
 String[] tokens = lines[i].split( " " );
 int tokenCount = tokens.length;
 println(tokenCount);
 int[] data = new int[tokenCount];
 for ( int j = 0; j < tokenCount-1; j++)
 {
 data[j] = Integer.parseInt(tokens[j]);
 }
 configs[i] = data;
 System.out.println (java.util.Arrays.toString(data));
 }  
 return configs;
 }  
 
 public void levelBuilder() {
 //  try {
 
 String lines[] = loadStrings("level01.txt");
 
 println("there are " + lines.length + " lines");
 
 
 int[][] instructions = readConfig(lines);
 for (int r = 0; r < instructions.length; r++) {
 println("");
 for (int c = 0; c < instructions[r].length; c++) {
 print(instructions[r][c] + " ");
 }
 }
 
 numObs = instructions[0][0];
 numSets = instructions[0][1];
 
 obs = new Blockable[numObs];
 int xcor;
 int ycor;
 int obsCount = 0;
 Blockable b1, b2;
 for (int set = 1; set <= numSets; set++) {
 
 xcor = instructions[set][0];
 ycor = instructions[set][1];
 println(xcor + " " + ycor);
 
 int first = instructions[set][2];
 if (first != 0) {
 b1 = deepClone(obstacles[first]);
 b1.y = ycor;
 println("b1 y:" + b1.y);
 obs[obsCount] = b1;
 obsCount++;
 }
 
 int second = instructions[set][3];
 if (second != 0) {
 b2 = deepClone(powerups[second]);
 b2.y = ycor;
 println("b2 y:" + b2.y);
 obs[obsCount] = b2;
 obsCount++;
 }
 }
 
 int count = 0;
 for (Blockable b : obs) {
 println(count + " " + b.toString());
 count++;
 }
 println("count: " + count);
 }*/

/*public void levelBuilder() {
  print("hell");
  String filename = "level01.txt";
  File file;
  try {
    file = new File(filename);
    s = new Scanner(file);
  }
  catch (FileNotFoundException e) {
    println("nope");
  }
  numObs = s.nextInt();
    numSets = s.nextInt();
    obs = new Blockable[numObs];
    print("ok");
    
    for(int i=0; i<numObs; i++){
        int shape = s.nextInt();
        float dia = s.nextInt();
        float x = s.nextInt();
        float y = s.nextInt();
        float speed = s.nextFloat();
        int powerUp = s.nextInt();
        println(y);
        
        if(shape == 1){
          obs[i]= new CircleObstacle(dia, x, y, speed, randomOri());
        }else if(shape == 2){
          obs[i]= new SquareObstacle(dia,x,y,speed,randomOri());
        }else if(shape==3){
          obs[i]= new PlusObstacle(dia,x,y,speed,randomOri());
        }else if(shape==4){
          obs[i]= new TriangleObstacle(myColor,dia,x,y,speed,randomOri());
        }else if(shape==5){
          obs[i]= new BarObstacle(y);
        }
        
        if(powerUp==1){
          obsP[i] = new Star(y);
        }else if(powerUp==2){
          obsP[i] = new ColorChanger(y);
        }
    }
    
    s.close();
}


public Blockable deepClone(Blockable template) {
  Blockable b;
  if (template instanceof CircleObstacle) {
    b = new CircleObstacle();
  } else if (template instanceof ColorChanger) {
    b = new ColorChanger();
  } else {
    b = new Star();
  }
  b.diameter = template.diameter;
  b.x = template.x;
  b.y = template.y;
  b.angle = template.angle;
  b.speed = template.speed;
  b.clockwise = template.clockwise;
  b.exist = template.exist;
  return b;
}*/


// ----------------------END OF LEVEL BUILDER CODE---------------------------------


// sets up the world and initialized score
public void setup() {
  size(400, 600);
  main = new Ball();
  starsString = loadStrings("highscore.txt");
  highest = int(starsString[0]);
  score=0;
}


// draws the world
public void draw() {
  // beginning of game
  if (status == "start") {
    background(0);
    startScreen();
  }

  //-----playing game------
  else if (status =="play") {
    play();
    playInterface();
    end();

    //text(yMin, 100, 100);
  }

  // paused game
  else if (status == "pause") {
    pauseScreen();
  }

  // when the game ends
  else if (status == "end") {
    endScreen();
    if (score>highest) {
      highest=score;
    }
    String high = "" + highest + "";
    //System.out.println(highest);

    System.out.println("PREV HIGHEST SCORE:" + starsString[0]);
    starsString[0] = high;
    System.out.println("YOUR SCORE:" + score);
    saveStrings("highscore.txt", starsString);
  }
}


// displays the menu/score/buttons
public void playInterface() {
  // DISPLAY PAUSE BUTTON
  pauseButton();

  // DISPLAY SCORE
  fill(255);
  textSize(50);
  text(score, 200, 50);
  textSize(32);
  text(highest, 380, 45);
  textSize(26);

  fill(86, 199, 162);
  rect(25, 550, 30, 30, 10);
  fill(0);
  textSize(35);
  if (main.getNatural()) {
    text("↓", 40, 577);
  } else {
    text("↑", 40, 577);
  }
}


// sets the game in motion
public void play() {
  background(0);
  main.move();
  if (mode == "random") {
    // instructions for random mode
    playRandom();
  }/* else if (mode == "challenge") {
    // instructions for challenge mode
    levelBuilder();
    playChallenge();
  }*/
  storeColor();
  obstacleShift();
  main.display();
  myColor = main.getColor();
}



// random mode instructions
public void playRandom() {

  for (int i=0; i<4; i++) {
    change(showing[i]);
    change(showingPows[i]);
    showing[i].spin();
    showingPows[i].spin();
    if (showing[i].y>400) {
      generateNewStuff(i);
    }
  }
}



// challenge mode instructions
public void playChallenge() {

  for (Blockable b : obs) {
    b.display();
    change(b);
    b.spin();
  }
}


// randomly generates new obstacles and powerups
public void generateMore(float ycor, int i) {
  int n = (int)(Math.random()*2 );
  //if (!isPUPres) {
  if (n==0) {
    showingPows[i] = new Star(ycor);
    isPUPres = true;
  } else {
    showingPows[i] = new ColorChanger(ycor);
    isPUPres = true;
  }
  //}
}

// generates a random diameter
public int randomRadii() {
  return (int)(Math.random() * 74) + 60;
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
public void generateNewStuff(int i) {
  if (showing[i].y > 600+showing[i].diameter/2) {
    float n = (int)(Math.random() * 4);
    float rad = randomRadii();
    if (yMin > 0 ) {
      yMin = -rad;
    }
    if (n == 0) {
      yMin+= -100 - rad;
      showing[i] = new CircleObstacle(yMin, rad);
      generateMore(yMin, i);
      yMin += - rad;
    }
    if (n == 1) {
      yMin+= -150 - rad;
      showing[i] = new SquareObstacle(yMin, rad);
      generateMore(yMin, i);
      yMin += -rad;
    }
    if (n == 2) {
      yMin += -100 - rad;
      showing[i] = new PlusObstacle(yMin, rad);
      generateMore(yMin-20, i);
      yMin += -rad;
    }
    if (n == 3) {
      yMin += -100 - rad;
      showing[i] = new TriangleObstacle(myColor, yMin, rad);
      generateMore(yMin, i);
      yMin += -rad;
    }
    /*if (n == 4) {
     yMin += -104;
     showing[i] = new BarObstacle(yMin);
     generateMore(yMin-20);
     yMin += -4;
     }*/
  }
}


// initializes first obstacles in random mode
public void start() {
  showing[0] = new CircleObstacle(200, 200, 200, 0.02, true);
  showingPows[0] = new Star(200+175);
  showing[1] = new SquareObstacle(200, 200, -170, randomSpeed(), true);
  showingPows[1] = new ColorChanger(-170+175);
  showing[2] = new CircleObstacle(200, 200, -540, randomSpeed(), false);
  showingPows[2] = new Star(-540+175);
  showing[3] = new SquareObstacle(200, 200, -910, randomSpeed(), false);
  showingPows[3] = new Star(-910+175);
  yMin = -910;
}


// shifts the obstacles down as the ball moves down
public void obstacleShift() {
  if (main.getY()<300) {
    if (mode=="random") {
      for (int i=0; i<4; i++) {
        //showing[i].move((300-main.y)/100);
        //showingPows[i].move((300-main.y)/100);
        showing[i].move(.9);
        showingPows[i].move(.9);
      }
      yMin+=.9+.75;
    }
    if (mode=="challenge") {
      for ( Blockable b : obs) {
        //b.move((300-main.y)/100);
        b.move(.9);
      }
    }
  }
}


// checks color on top and bottom of ball
public void storeColor() {
  top = get(200, int(main.getY()-main.getDiameter()/2));
  bottom = get(200, int(main.getY()+main.getDiameter()/2));

  // debugging 
  noStroke();
  fill(top);
  ellipse(40, 20, 10, 10);
  fill(bottom);
  ellipse(40, 60, 10, 10);
}



public void mousePressed() {
  // pauses the game
  if (status=="play") {
    if (mouseX>=25 && mouseX<=55 && mouseY>=17 && mouseY<=47) {
      status = "pause";
    } else {
      main.toggleFalling(false);
    }
    // resumes the game
  } else if (status == "pause") {
    if (mouseX>=25 && mouseX<=55 && mouseY>=17 && mouseY<=47) {
      status = "play";
      //start();
    }
    if (mouseX>=130 && mouseY>=500 && mouseX<=130+140 && mouseY<=550) {
      setup();
      status = "start";
    }
    // starts the game
  } else if (status == "start") {
    //if (mouseX>=105 && mouseY>=400 && mouseX<=295 && mouseY<=450) {
      //mode = "challenge";
      //levelBuilder();
    //} else {
      //if (mouseX>=125 && mouseY>=325 && mouseX<=275  && mouseY<=375) {
      mode = "random";
      start();
      //}
    //}
    status = "play";
    // restarts the gam
  } else if (status == "end") {
    setup();
    status = "play";
    if (mode == "random") {
      start();
    }
    /*if (mode == "challenge") {
      levelBuilder();
    }*/
  }
}

public void keyPressed() {
  if (key == ' ') {
    // starts the game
    if (status == "start") {
      status = "play";
      mode = "random";
      start();
      // pauses the game
    } else if (status == "play") {
      main.toggleFalling(false);
      // resumes the game
    } else if (status == "pause") {
      status = "play";
      // restarts the game
    } else if (status == "end") {
      setup();
      status = "play";
      start();
    }
  }
  // pauses/resumes the game
  if (key == 'x') {
    if (status == "play") {
      status = "pause";
    } else if (status == "pause") {
      status = "play";
    }
  }
  if (key == 'g' && status == "play") {
    main.toggleNatural();
  }
}


//checks for if the ball collides with obstacles
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
    //System.out.println("COLLIDED COLLIDED COLLIDED COLLIDED");
    return true;
  }
  return false;
}


// ends the game 
public void end() {
  if (main.getBottom()>600) {
    status="end";
  }
  if (top!=myColor && top!=color(0)) {
    //System.out.println("COLLIDED W");
    //printColor(top);
    if (doesCollide(0)) {

      status="end";
      //System.out.println("Top prob");
    }
  }
  if (bottom!=myColor && bottom!=color(0)) {
    if (doesCollide(1)) {
      status="end";
      //System.out.println("Bot prob");
    }
  }
}

// debugging
public void printColor(color c) {
  System.out.println("(" + red(c) + "," + green(c) + "," + blue(c) + ")" );
}


// gets rid of powerups
public void change(Blockable cc) {
  if (cc instanceof ColorChanger) {
    if (cc.status() && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
      main.setColor();
      cc.destroy();
      isPUPres=false;
    }
  }
  if (cc instanceof Star) {
    if (cc.status() && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))>0 && ((cc.getY()+10) - (main.getY() - main.getDiameter()/2))<20) {
      score++;
      cc.destroy();
      isPUPres=false;
    }
  }
}


// generates the start screen
public void startScreen() {
  textSize(20);
  fill(255);
  textAlign(CENTER);
  text("ZWANG!!! presents", 200, 200);
  textSize(50);
  text("COLOR SWITCH", 200, 270);

  fill(86, 199, 162);
  rect(125, 325, 150, 50, 10);
  //rect(105, 400, 190, 50, 10);
  textSize(30);
  fill(0);
  text("RANDOM", 200, 360);
  //text("CHALLENGE", 200, 360+75);
}

public void pauseButton() {
  fill(86, 199, 162, 200);
  textSize(25);
  rect(25, 17, 30, 30, 10);
  fill(0);
  text("||", 40, 40);
}

public void pauseScreen() {
  fill(255, 0, 0);
  textSize(20);
  rect(25, 17, 30, 30, 10);
  fill(0);
  text("X", 40, 40);

  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("GAME", 200, 250);
  text("PAUSED", 200, 350);

  textSize(20);
  fill(250);
  text("Score:", 150, 40);
  text("Score to Beat:", 300, 40);

  textAlign(CENTER);
  text("HINT: click space to jump", 200, 400);
  text("HINT: click 'x' to pause and unpause", 200, 430);

  fill(86, 199, 162);
  rect(130, 500, 140, 50, 10);
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Main Menu", 200, 530);
}



// generates end screen
public void endScreen() {
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("GAME", 200, 250);
  text("OVER", 200, 350);
}