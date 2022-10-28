float SCALE_STEPS[]={0, 50, 10}; 
// use it as SCALE_STEPS[MONTECARLO_STEPS]
float SCALE_STEP=SCALE_STEPS[MONTECARLO_STEPS];
    
class Walker {
  PVector position;
  PVector prevPosition;
  float freq, amp, cutoff, vibrato;
  float stepsize=0;
  Walker() {
    this.position=new PVector(width/2, height/2);
    this.prevPosition=this.position.copy();    
    this.amp=0; this.vibrato=0;
    this.freq=0;
    this.cutoff=0;
  }
  
  void draw() {        
    PVector fromCenter=PVector.sub(this.position, CENTER_SCREEN);
    float normAngle= map(fromCenter.heading(), -PI, PI, 0, 1);
    colorMode(HSB);
    color c=color(normAngle*255,255,255);    
    stroke(c);
    strokeWeight(3);
    line(this.prevPosition.x, this.prevPosition.y,
         this.position.x, this.position.y);
  }
  void computeEffect(){
     this.freq= map(this.position.x + this.position.y, 
                    0, width+height, 
                    110, 220);
     this.amp = constrain(this.stepsize, 0.1, 1);      
  }
  
  void update() {    
    PVector step; // this is the direction
    step=new PVector(random(-1,1), random(-1,1));
    step.normalize();
    
    float stepsize=montecarlo();
    this.stepsize=stepsize;
    step.mult(stepsize*SCALE_STEP);
    this.prevPosition=this.position.copy();   
    this.position.add(step);
    this.position.x=constrain(this.position.x, 0, width);    
    this.position.y=constrain(this.position.y, 0, height);
  }
}

float montecarlo() {
  while (true) {
     float R1=random(1);
     float p=0;
     if(MONTECARLO_STEPS==2){
        p=random(1);
     }
     if(MONTECARLO_STEPS==1){
        p=pow(1-R1,8);
     }
     float R2=random(1);
     if (R2<p){ return R1;}
  }
}
