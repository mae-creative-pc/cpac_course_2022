PImage img;
int smallPoint, largePoint;
myPoint p;

void setup() {
  size(1024, 576);
  frameRate(60);
  
  img = loadImage("40704.jpg");
  
  smallPoint = 40;
  largePoint = 80;
  color c = color(0, 0, 0);
  p = new myPoint(10, 10, 40, c);
  
  imageMode(CENTER);
  noStroke();
  background(255);

}

void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  p.move(x,y);
  p.plot(smallPoint, pix);
}
