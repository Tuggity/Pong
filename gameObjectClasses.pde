private class gameObject {
  //position & size
  float x, y;
  
  public boolean collision(gameObject obj){
    return false;
  }
  
  public void draw(){
    
  }
  
  public void update(float dt){
    
  }
}

public class ball extends gameObject  {
  float radius;
  
  //angle and speed
  float direction;
  PVector velocity;
  float speed;
  
  //create ball and set initial direction
  public ball(){
    x = 150;
    y = 100;
    
    speed = 100;
    direction = radians(80);//random(360);
    velocity = new PVector(cos(direction), -sin(direction));
  }
  
  public void pitchBall() {
    direction = random(360);
    speed = 100;
  }
  
  public boolean collision(){
    
    if (y <= 0 || y >= 200) {
      velocity.y = -velocity.y;  
      return true;
    } 
    if (x <= 0 || x >= 300) {
      //GOAL!!!
      velocity.x = -velocity.x;  
      return true;
    } 
    return false;
  };
  
  public void update(float dt) {
    collision();
    
    x += velocity.x*speed*dt;
    y += velocity.y*speed*dt;
    
    //x += 60*dt;
    
   //non final implementation, no collison detection
   //if (x < 25)
   // direction = 1;
   //else if (x > 300-25)
   // direction = -1;
   //x += speed*direction; 
  }
  
  public void draw() {
    strokeWeight(10);
    point(x, y);
    strokeWeight(0);
    //text(degrees(direction%360), 100,100);
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
  
  public void update(float dt){
    //y = currentController.input(new PVector (x, y));
  }
  
  public void draw(){
    stroke(255);
    rect(x-w/2,y-h/2,w,h);
  }
}