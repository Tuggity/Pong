//Pong Clone v0.2
//by Kasper Kristensen 09-03-2016

screen currentScreen;
mainMenu mainMenuInstance;
game gameInstance;

void setup() {  
  size(300,200);
  mainMenuInstance = new mainMenu();
  gameInstance = new game();
  
  currentScreen = mainMenuInstance;
}

void draw() {
  currentScreen.update();
  
  //clear screen
  background(0);
  stroke(255);
  
  currentScreen.draw();
}