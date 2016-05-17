Ball b1;
CircleObstacle cO1 = new CircleObstacle();
ColorChanger cC1;

boolean play = true;

public void setup() {
  size(400, 600);
  b1 = new Ball();
  cC1 = new ColorChanger(300);
}

public void draw() {
  if (play==true) {
    background(0);
    cO1.spin();
    cC1.display();
    b1.move();
    b1.display();
    changeColor();
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

public void keyPressed(){
  if(key == ' '){
    mousePressed();
  }
}

public void end() {
  if (b1.getBottom()>600) {
    play=false;
  }
  if (abs(b1.getY()-(cO1.y+75))<5 && get(200,int(cO1.y+75))!=(b1.colorValue) 
     // b1.getY()==cO1.y-75 && get(200,int(cO1.y-75))!=(b1.colorValue) 
      ){
  
     play=false;
  }
  }



public void changeColor(){
  if(cC1.status() && b1.getY() - cC1.getY() < b1.getDiameter()/2){
    b1.setColor();
    cC1.destroy();
  }
}