Grid grid;
Shape shape, onDeck;
Background bg;

void setup(){
  size(720,720);  
  grid = new Grid();
  shape = new Shape();
  shape.isActive = true;
  onDeck = new Shape();
  bg = new Background();
}

void draw(){
   //background(0);
   bg.display();
   grid.display();
   shape.display();
   shape.moveDown();
   checkBottom();
}

void drawShape(){
  bg.writeShape(shape);
}
void keyPressed(){
  if(keyCode == RIGHT){
    shape.move("RIGHT");
  } else if (keyCode == LEFT){
    shape.move("LEFT");
  } else if (keyCode == DOWN){
    shape.move("DOWN");
  }
}

void keyReleased(){
  if(keyCode == UP){
    shape.rotate();
    shape.rotate();
  } 
  shape.rotCount++;
}

void checkBottom(){
  if(!shape.isActive){
    drawShape();
    shape = onDeck;
    shape.isActive = true;
    onDeck = new Shape();
  }
}
