abstract class controller extends gameObject {
  boolean isPlayer;
  bat actorPointer;
}

public class playerController extends controller{
   public playerController(bat setPointer){
     actorPointer = setPointer;
     isPlayer = true; 
   }
   
   public void update(){
      actorPointer.y = mouseY;
   }
}

public class aiController extends controller{
  ball ballPointer;
  
  public aiController(bat setPointer, ball setBallPointer){
     actorPointer = setPointer;
     ballPointer = setBallPointer;
     isPlayer = false; 
   }
   
  public void update(){
      if (ballPointer.y < actorPointer.y) {
        actorPointer.y -= 1;
      } else if (ballPointer.y > actorPointer.y) {
        actorPointer.y += 1;
      }
   } 
}