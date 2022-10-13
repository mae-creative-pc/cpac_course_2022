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
    /* your code here*/
    
    stroke(255);
    line(this.prevPosition.x, this.prevPosition.y,
         this.position.x, this.position.y);
  }
  void computeEffect(){
    /* your code here*/
     ;      
  }
  
  void update() {    
    PVector step; // this is the direction
    step=new PVector(random(-1,1), random(-1,1));
    step.normalize();
    
    float stepsize=montecarlo();
    /* your code here, remember to:
    - update prevPosition
    - constrain position inside the screen*/
      }
}

float montecarlo() {
  return 0;
}
