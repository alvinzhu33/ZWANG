public class CircleObstacle {
  private float diameter;
  private float x,y;

  public CircleObstacle() {
    diameter=150;
    
    x = 200;
    y = 150;
  }
  public CircleObstacle(float dia) {
    diameter=dia;
    
    x = 200;
    y = 150;
  }
  
  public CircleObstacle(float dia, float x, float y) {
    diameter=dia;
    
    this.x = x;
    this.y = y;
  }
  
  void display(){
    noStroke();
    
    fill(0,0,255);
    arc(x,y,diameter,diameter,0,HALF_PI);
    
    fill(255,0,0);
    arc(x,y,diameter,diameter,HALF_PI,PI);
    
    fill(0,255,0);
    arc(x,y,diameter,diameter,PI,3*HALF_PI);
    
    fill(255,255,0);
    arc(x,y,diameter,diameter,3*HALF_PI,2*PI);
    
    fill(0);
    ellipse(x,y,diameter*3/4,diameter*3/4);
  }
}