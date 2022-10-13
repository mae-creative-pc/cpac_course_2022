
class Particle{
  PVector pos, vel, acc;
  float radius, lifespan;
  float hue;
  Particle(PVector pos, float radius, float lifespan){
    this.pos= pos.copy();
    this.vel = new PVector(randomGaussian()*0.3+0,randomGaussian()*0.3-2);
    this.acc = new PVector();
    this.radius=radius;
    this.lifespan=lifespan;
    this.hue=random(0,255);
  }
  void update(){    
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  
  void applyForce(PVector force){    
    this.acc.add(force);    
  }
  
  void draw(){
    imageMode(CENTER);
    tint(255, this.lifespan);
    image(img, this.pos.x, this.pos.y);

 }
  boolean isDead(){
    return this.lifespan<=0;
  }
}
