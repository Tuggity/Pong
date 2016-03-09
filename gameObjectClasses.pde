private class gameObject {
  //position & size
  float x, y;
  
  public boolean collision(gameObject obj){
    return false;
  }
  
  public void draw(){
    
  }
  
  public void update(){
    
  }
}

public class ball extends gameObject  {
  float radius;
  
  //angle and speed
  float direction;
  float speed;
  
  //create ball and set initial direction
  public ball(){
    x = 150;
    y = 100;
    
    speed = 1;
  }
  
  public void pitchBall() {
    direction = random(360);
    speed = 1;
  }
  
  public boolean collision(bat test){
    return false;
  };
  
  public void update() {
   x += 1; 
  }
  
  public void draw() {
    strokeWeight(10);
    point(x, y);
  }  
}

public class bat extends gameObject{
  controller currentController;
  
  float w, h;
  
  public bat(controller setController, boolean isRight){
    currentController = setController;
    
    if (!isRight) {
      x = 300-15;
    } else {
      x = 15;
    }
    
    y = 100;
    
    w = 5;
    h = 50;
  }
  
  public void draw(){
    stroke(255);
    rect(x-w/2,y-h/2,w,h);
  }
}