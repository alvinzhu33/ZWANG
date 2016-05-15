public class Ball {
  
    private float x,y;
    private boolean isFalling;
    
    public Ball(float startX, float startY){
       x=startX;
       y=startY;
       isFalling=true;
    }  
    

    public void toggleFalling(boolean flag){
      isFalling=flag;
    }
    
    public void move(){
      if (b1.isFalling){
        b1.y+=gravity;
      }else{
        b1.y-=40;
        b1.toggleFalling(true);
      }
    }
    
    void display(){
      arc(x,y,25,25,0,2*PI); 
      stroke(255);
      fill(255);
    }
  
  
}