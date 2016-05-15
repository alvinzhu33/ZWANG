public class Ball{
  int diameter;
  
  public Ball(){
    diameter = 20;
    
    noStroke();
    ellipse(200,600,diameter,diameter);
  }
  public Ball(int dia){
    diameter = dia;
    
    ellipse(200,600,dia,dia);
  }
}