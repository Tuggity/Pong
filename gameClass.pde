abstract class screen{
 abstract void update();
 abstract void draw();
}

public class game extends screen{
  ArrayList<gameObject> objects;
  
  public ball newBall;
  bat playerBat, aiBat;
  controller player, ai;
  
  public game(){
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
  
  public void update(){
    //game logic
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).update();
    }
  }
  
  public void draw(){
    //rendering
    background(0);
    stroke(255);
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).draw();
    } 
  }
}