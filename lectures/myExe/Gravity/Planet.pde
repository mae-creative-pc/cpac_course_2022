
public class Planet {
  
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float mass;
  color c;
  float maxspeed;
  float maxforce;
  
  Planet(float x, float y,PVector vel, float r, float mass, color c){
    this.loc = new PVector(x, y);
    this.vel = vel;
    this.r = r;    
    this.mass = mass;
    this.acc = new PVector(0,0);
    this.c = c;
    this.maxspeed = 4;
    this.maxforce = 0.1;
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    vel.div(mass*0.01);
    loc.add(vel);    
  }
  
  void gravity(Planet other) {
    PVector dir = PVector.sub(other.loc, this.loc);
    dir.normalize();
    float dist = PVector.dist(other.loc, this.loc);
    dir.mult(other.mass*this.mass);
    dir.div(pow(dist,2));
    this.acc.set(dir);
    this.acc.limit(maxforce);
  }
  
  void drawer() {    
    fill(c);
    ellipse(loc.x, loc.y, r, r);    
  }
  
}
