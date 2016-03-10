//Pong Clone v0.2
//by Kasper Kristensen 09-03-2016

screen currentScreen;
game gameInstance;

void setup() {  
  size(300,200);
  gameInstance = new game();
  currentScreen = gameInstance;
}

void draw() {
  currentScreen.update();
  
  currentScreen.draw();   
}