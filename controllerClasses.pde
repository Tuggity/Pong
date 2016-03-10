abstract class controller {
  boolean isPlayer;
  
  abstract float input(PVector ball);
}

public class playerController extends controller{
   public playerController(){
     isPlayer = true; 
   }
   
   public float input(PVector currentPosition){
      return mouseY;
   }
}

public class aiController extends controller{
  public float input(PVector currentPosition){
      //if (newBall.y < currentPosition.y) {
      // return currentPosition.y-1f; 
      //} else if (newBall.y > currentPosition.y) {
      // return currentPosition.y+1.0f; 
      //}
      return currentPosition.y;
   } 
}