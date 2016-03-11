abstract class screen{
 abstract void update();
 abstract void draw();
}

public class mainMenu extends screen{
  boolean selected;
  public void update(){
    if (mouseY > 100-textAscent() && mouseY < 100+textDescent()){
      textSize(16);
      if (mouseX > 150-textWidth("start")/2 && mouseX < 150+textWidth("start")/2){
          selected = true;
          if (mousePressed){
            currentScreen = gameInstance;
          }
        } else {
          selected = false;
        }
    } else {
          selected = false;
    }
  }
  
  public void draw(){
    textSize(32);
    fill(255,255,255);
    textAlign(CENTER);
    text("PONG", 150, 50);
    
    textSize(16);
    if (selected) {fill(255, 0, 0);}
      else {fill(255, 255, 255);}
    text("Start", 150, 100);
  }
}

public class game extends screen{
  ArrayList<gameObject> objects;
  
  public ball newBall;
  bat playerBat, aiBat;
  controller player, ai;
  
  public game(){
    objects = new ArrayList<gameObject>();
    
    newBall = new ball();
    objects.add(newBall);
    
    playerBat = new bat(true);
    objects.add(playerBat);
    
    aiBat = new bat(false);
    objects.add(aiBat);
    
    player = new playerController(playerBat);
    objects.add(player);
    
    ai = new aiController(aiBat, newBall);
    objects.add(ai);
  }
  
  public void update(){
    //game logic
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).update();
    }
  }
  
  public void draw(){
    //rendering
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).draw();
    } 
  }
}