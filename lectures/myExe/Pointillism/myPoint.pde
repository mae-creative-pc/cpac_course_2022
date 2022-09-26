class myPoint{
  
  float x, y;
  float size;
  color c;
  
  public myPoint(float x, float y, float size, color c){
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  public void plot(float size, color c){
    noStroke();
    fill(c, 128);
    ellipse(x, y, size, size);
  }
  
  public void move(float newX, float newY){
    this.x = newX;
    this.y = newY;
  }
}
