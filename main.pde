//Pong Clone v0.1
//by Kasper Kristensen 09-03-2016

ArrayList<gameObject> objects;
ball newBall;
bat playerBat, aiBat;
controller player, ai;

void setup() {  
  size(300,200);
  
  objects = new ArrayList<gameObject>();
  
  player = new playerController();
  ai = new aiController();
  
  newBall = new ball();
  objects.add(newBall);
  
  playerBat = new bat(player, true);
  objects.add(playerBat);
  
  aiBat = new bat(ai, false);
  objects.add(aiBat);
}

void draw() {
    //game logic
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).update();
    }
    
    //rendering
    background(0);
    stroke(255);
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).draw();
    }
}