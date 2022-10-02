Mover m;
Mover m2;

void setup() {
  size(800,200);
  smooth();
  m = new Mover();
  m2 = new Mover();
}

void draw() {
  background(255);

  PVector wind = new PVector(0.1,0);
  PVector gravity = new PVector(0,0.3);
  m.applyForce(wind);
  m.applyForce(gravity);
  
  m2.applyForce(wind);
  m2.applyForce(gravity);


  m.update();
  m.display();
  m.checkEdges();
  
  m2.update();
  m2.display();
  m2.checkEdges();

}
