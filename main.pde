ball newBall;

void setup() {  
  size(300,200);
  newBall = new ball();
}

void draw() {
    //game logic
    newBall.update();
    
    //rendering
    background(0);
    stroke(255);
    newBall.draw();
}