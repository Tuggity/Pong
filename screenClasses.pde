abstract class screen{
 abstract void update();
 abstract void draw();
}

public class mainMenu extends screen{
  boolean selected;
  float paddleTilt = radians(90);
  boolean clockwise;
  
  bat screenBat = new bat(true);
  
  public mainMenu(){
   screenBat.x = 150;
   screenBat.y = 50;
  }
  
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
    
    if (paddleTilt > radians(-45+90) && paddleTilt < radians(45+90)){
      if (clockwise)
          paddleTilt -= radians(0.5);
        else
          paddleTilt += radians(0.5);
    } else {
     clockwise = !clockwise; 
     if (clockwise)
          paddleTilt -= radians(0.5);
        else
          paddleTilt += radians(0.5);
    }
      
    
  }
  
  public void draw(){
    //background(0);
    textSize(32);
    fill(255,255,255);
    textAlign(CENTER);
    text("PONG", 150, 50);
    
    textSize(16);
    //if (selected) {fill(255, 0, 0);}
    //  else {fill(255, 255, 255);}
    text("Start", 150, 100);
    
    //paddle inverts colors
    loadPixels();
    PGraphics stencil = createGraphics(300, 200);
    
    pushMatrix();
    stencil.beginDraw();
    stencil.background(0);
    stencil.translate(mouseX, mouseY);
    stencil.rotate(paddleTilt);
    //PImage inverted = get(mouseX-30, mouseY-10, 60, 20);
    PImage inverted = createImage(60, 20, RGB);
    inverted.loadPixels();
    for (int i = 0; i < inverted.pixels.length; i++) {
      inverted.pixels[i] = color(255, 255, 255); 
    }
    inverted.updatePixels();
    stencil.translate(-mouseX, -mouseY);
    //stencil.image(inverted, mouseX-30, mouseY-10);
    stencil.rect(mouseX-15/2,mouseY-60/2,15,60);
    stencil.endDraw();
    popMatrix();
    
    PImage screenCopy = get();
    screenCopy.mask(stencil);
    screenCopy.filter(INVERT);
    
    image(screenCopy, 0, 0);
    
    //image(stencil, 0, 0);
    
    
    
    //paddle inverts colors
    //loadPixels();
    //PImage paddle = createImage(60, 20, RGB);
    
    ////for (int i = 0; i < paddle.pixels.length; i++) {
    //  for (int h = 0; h < paddle.height; h++){  
    //    for (int w = 0; w < paddle.width; w++){
    //      if (mouseY+h < 200 && mouseX+w < 300)
    //        paddle.pixels[h*paddle.width+w] = pixels[(mouseY+h)*300+(mouseX+w)];
    //    }
    //  }
    ////}
    //paddle.filter(INVERT);
    //paddle.updatePixels();
    //image(paddle, mouseX, mouseY); 
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