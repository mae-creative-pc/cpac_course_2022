float alpha=0.1;
class AgentPendulum{
  PVector pivotPos, massPos;
  float angle, aVel, aAcc;
  float r, mass, radius;
  float vibrato=0; float cutoff=0;
  float initAngle;
  AgentPendulum(float x, float y, float r, float mass){
    this.pivotPos = new PVector(x, y);
    this.angle=random( -PI/2, -PI/4);
    this.initAngle = angle;
    this.r=r;
    this.mass=mass;
    this.aVel=0;
    this.aAcc=0;
    this.massPos = new PVector(0, 0);
    this.radius=sqrt(this.mass/PI)*MASS_TO_PIXEL;    
  }
  void update(){    
    this.aVel+=this.aAcc;
    this.angle+=this.aVel;
    this.aAcc=0;
    this.massPos.set(this.r*sin(this.angle), this.r*cos(this.angle));
    this.massPos.add(this.pivotPos);
  }
  void computeEffect(){
    this.vibrato=map(this.angle, -PI/2, PI/2, -1, 1);
    this.cutoff=map(this.aAcc, -PI/2, PI/2, -1, 1);
    
  }
  void applyForce(float force){    
    this.aAcc= force/this.mass;
  }
  void draw(){
    fill(200);
    
    
    /* your code below */
    // 1) draw pivot
    
    strokeWeight(0);
    ellipse(pivotPos.x, pivotPos.y, 30, 30);
    
    // 2) draw arm
    stroke(255);
    strokeWeight(3);
    line(pivotPos.x, pivotPos.y, massPos.x, massPos.y);    
    // 3) draw mass
    
    strokeWeight(0);
    ellipse(massPos.x, massPos.y, radius, radius);
    
  }
}