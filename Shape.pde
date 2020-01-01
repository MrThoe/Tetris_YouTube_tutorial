public class Shape{
   
  //7 Tetris Shapes
  private int[][] square = {{0,0}, {1,0}, {0,1}, {1,1}};
  private int[][] ln = {{0,0}, {1,0}, {2,0}, {3,0}};
  private int[][] tri = {{0,0}, {1,0}, {2,0}, {1,1}};
  private int[][] rightL = {{0,0}, {1,0}, {2,0}, {2,1}};
  private int[][] leftL = {{0,0}, {1,0}, {2,0}, {0,1}};
  private int[][] theS = {{0,0}, {1,0}, {1,1}, {2,1}};
  private int[][] otherS = {{0,1}, {1,0}, {1,1}, {2,0}};
  
  //other fields
  private int[][] theShape, oS;   //Original Shape
  private boolean isActive;
  private int counter, r, g, b;
  private float w; //width of each block in the piece
  private int choice, rotCount;
  
  public Shape(){
    choice = (int)random(7);
    w = width/24;
    switch(choice){
       case 0: theShape = square;
               r = 255;
               break;
       case 1: theShape = ln;
               g = 255;
               break;      
       case 2: theShape = tri;
               b = 255;
               break;
       case 3: theShape = leftL;
               r = 255;
               g = 255;
               break;               
       case 4: theShape = rightL;
               g = 255;
               b = 255;
               break;
       case 5: theShape = theS;
               r = 255;
               b = 255;
               break;
       case 6: theShape = otherS;
               r = 255;
               g = 255;
               b = 255;
               break;               
    }
    counter = 1;
    oS = theShape;
    rotCount = 0;
  }
  
  public void display(){
    fill(r,g,b);
    for(int i = 0; i < 4; i++){
        rect(theShape[i][0]*w, theShape[i][1]*w, w, w);  
    }
  }

  public void moveDown(){
     if(counter % 50 == 0){
       move("DOWN");
     }
     counter++;
  }

  public boolean checkSide(String side){
      
      switch(side){ 
         case "LEFT":
           for(int i = 0; i < 4; i++){
              if(theShape[i][0]<1){
                return false;
              }
           }
           break;
         case "RIGHT":
           for(int i = 0; i < 4; i++){
              if(theShape[i][0]>10){
                return false;
              }
           }
           break;
         case "DOWN":
           for(int i = 0; i < 4; i++){
              if(theShape[i][1]>22){
                isActive = false;
                return false;
              }
           }
           break;           
      }
      return true;
  }

  public void move(String dir){
     
    if(checkSide(dir)){
 
       switch(dir){
         case "LEFT":
           for(int i = 0; i < 4; i++){
              theShape[i][0]--;  
           } 
           break;
         case "RIGHT":
           for(int i = 0; i < 4; i++){
              theShape[i][0]++;  
           }
           break;
         case "DOWN":
           for(int i = 0; i < 4; i++){
              theShape[i][1]++;  
           }     
           break;
       }     
    }
  }
   
  public void rotate(){
    if(theShape != square){
       int[][] rotated = new int[4][2];
       if(rotCount % 4 == 0){
         for(int i = 0; i < 4; i++){
            rotated[i][0] = oS[i][1] - theShape[1][0];
            rotated[i][1] = -oS[i][0] - theShape[1][1];
         }
       } else if (rotCount % 4 == 1){
          for(int i = 0; i < 4; i++){
            rotated[i][0] = -oS[i][0] - theShape[1][0];
            rotated[i][1] = -oS[i][1] - theShape[1][1];
         }
       } else if (rotCount % 4 == 2){ 
         for(int i = 0; i < 4; i++){
            rotated[i][0] = -oS[i][1] - theShape[1][0];
            rotated[i][1] = oS[i][0] - theShape[1][1];
         }
       } else if (rotCount % 4 == 3){
          for(int i = 0; i < 4; i++){
            rotated[i][0] = oS[i][0] - theShape[1][0];
            rotated[i][1] = oS[i][1] - theShape[1][1];
         } 
       }
       theShape = rotated;
    }
  }

}
