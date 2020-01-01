public class Grid{

  private int w;
  
  public Grid(){
      w = width / 24;
  }
    
  public void display(){
    strokeWeight(4);
    stroke(155);
    for(int i = 0; i < 13; i++){
        line(0,w*i, width/2, w*i);
        line(0,w*(i+12), width/2, w*(i+12));
        line(w*i, 0, w*i, height);
    }
  }
  
}
