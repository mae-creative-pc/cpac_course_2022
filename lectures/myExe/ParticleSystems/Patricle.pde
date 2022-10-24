
class Particle{
  PVector location, velocity, acceleration;
  float radius, lifespan, mass;
  
  Particle(PVector location, float radius, float lifespan){
    this.location = location.copy();
    this.velocity = new PVector();
    this.acceleration = new PVector();
    this.radius = radius;
    this.lifespan = lifespan;
    this.mass = 1;
  }
  
  void update(){
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);  // Force/Mass
    acceleration.add(f);
  }
  
  void run(){
    this.update();
    fill(200, this.lifespan);
    noStroke();
    ellipse(this.location.x, this.location.y, this.radius, this.radius);
  }
  
  boolean isDead(){
    return this.lifespan<=0;
  }
  
}
