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
    x = width/2;
    y = height/2;
    
    speed = 2;
    direction = 1;
  }
  
  public void pitchBall() {
    x = width/2;
    y = height/2;
    direction = random(360);
    speed = 1;
  }
  
  public boolean collision(bat test){
    return false;
  };
  
  public void update() {
   //non final implementation, no collison detection
   if (x < 25)
     direction = 1;
   else if (x > 300-25)
     direction = -1;
   x += speed*direction; 
  }
  
  public void draw() {
    strokeWeight(10);
    point(x, y);
    strokeWeight(0);
  }  
}

public class bat extends gameObject{
  //controller currentController;
  
  float w, h;
  
  public bat(boolean isRight){
    //currentController = setController;
    
    if (!isRight) {
      x = 300-15;
    } else {
      x = 15;
    }
    
    y = 10;
    
    w = 15;
    h = 60;
  }
  
  public void update(){
    //y = currentController.input(new PVector (x, y));
  }
  
  public void draw(){
    stroke(255);
    rect(x-w/2,y-h/2,w,h);
  }
}