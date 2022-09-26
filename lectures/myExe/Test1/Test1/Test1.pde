 
float x, y;
int size = 10;

void setup(){
  size(400, 400);
  frameRate(100);
  
  x = 0;
  y = 0; // start from left top corner
}

// red point
void draw(){
  // if background() is set in draw it will be drawn every frame
  background(255); // white 
  // once the point reaches the end of the canvas comes back
  
  float lag1 = random(-1, 1);
  float lag2 = random(-1, 1);
  
  x = (x + lag1) % width; 
  y = (y + lag2) % height;
  
  fill(255, 0, 0);
  ellipse(x, y, size, size);
  
}
