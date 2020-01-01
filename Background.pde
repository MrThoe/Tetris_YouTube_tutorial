public class Background{

     private int[][][] colors;
     private int r,g,b;
     private int w;
     private int theX, theY;
     
  public Background(){
      colors = new int[12][24][3];
      w = width / 24;
  }
  
  //Write the method to draw a rectangle FOR every x,y using the colors RGB
  public void display(){
      for(int i = 0; i < 12; i++){
        for(int j = 0; j < 24; j++){
          r = colors[i][j][0];
          g = colors[i][j][1];
          b = colors[i][j][2];
          fill(r,g,b);
          rect(i*w, j*w, w, w);
        }
      }
  }
  
  public void writeShape(Shape s){
       //get theX and theY of each block
       for(int i = 0; i < 4; i++){
         theX = s.theShape[i][0];
         theY = s.theShape[i][1];
         //Write the colors of the shape into these x,y valuees
         colors[theX][theY][0] = s.r;
         colors[theX][theY][1] = s.g;
         colors[theX][theY][2] = s.b;
       }       
   }
}
