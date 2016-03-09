private class gameObject {
  //position & size
  float x, y;
  
  public boolean collision(gameObject obj){
    return false;
  }
}

public class ball extends gameObject  {
  float radius;
  
  //angle and speed
  float direction;
  float speed;
  
  //create ball and set initial direction
  private ball(){
    x = 150;
    y = 100;
    
    speed = 1;
  }
  
  public void pitchBall() {
    direction = random(360);
    speed = 1;
  }
  
  public void update() {
   x += 1; 
  }
  
  public void draw() {
    strokeWeight(10);
    point(x, y);
  }  
}

public class bat extends gameObject{
  
}