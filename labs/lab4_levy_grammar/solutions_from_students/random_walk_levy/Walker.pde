float SCALE_STEPS[]={0, 25, 25}; 
// use it as SCALE_STEPS[MONTECARLO_STEPS]
float SCALE_STEP=SCALE_STEPS[MONTECARLO_STEPS];
    
class Walker {
  PVector position;
  PVector prevPosition;
  float freq, amp, cutoff, vibrato;
  float stepsize=0;
  float angle=0;
  Walker() {
    this.position=new PVector(width/2, height/2);
    this.prevPosition=this.position.copy();    
    this.amp=0; this.vibrato=0;
    this.freq=0;
    this.cutoff=0;
  }
  
  void draw() {        
    /* your code here*/
    if(this.angle>=PI/4 &&this.angle<3*PI/4)
    {
      stroke(255,0,0);
    }
    else if(this.angle>=3*PI/4 && this.angle<5*PI/4)
    {
      stroke(0,255,0);
    }    
    else if(this.angle>=5*PI/4 && this.angle<7*PI/4)
    {
      stroke(0,255,255);
    }
    else{stroke(255,0,255);}
//    stroke(255);
    strokeWeight(3);
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
    this.angle=(2*PI+step.heading())%(2*PI);
    
    println(this.angle*180./PI);
    float stepsize=montecarlo();
    this.stepsize=stepsize;
    this.prevPosition = this.position.copy();
    this.position.add(PVector.mult(step,stepsize*SCALE_STEP));
    this.position.x = constrain(this.position.x, 0, width);
    this.position.y = constrain(this.position.y, 0, height);
    /* your code here, remember to:
    - update prevPosition
    - constrain position inside the screen*/
    }
}

float montecarlo() {
  float R2, R1, p; 
  R1=random(0,1);
  R2=random(0,1);
  if(MONTECARLO_STEPS==2){    
     // two-step sampling
     
     p=random(0,1);
     
   }
   else if(MONTECARLO_STEPS==1){
     // one-step sampling
     p = 1-R1;     
   }
   else{return 0;}
  if(R2<p){return R1;}
  return montecarlo();  
}
