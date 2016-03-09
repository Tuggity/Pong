ball newBall;

bat playerBat, aiBat;
controller player, ai;

void setup() {  
  size(300,200);
  newBall = new ball();
  
  player = new playerController();
  ai = new aiController();
  
  playerBat = new bat(player, true);
  aiBat = new bat(ai, false);
}

void draw() {
    //game logic
    newBall.update();
    
    //rendering
    background(0);
    stroke(255);
    newBall.draw();
    playerBat.draw();
    aiBat.draw();
}