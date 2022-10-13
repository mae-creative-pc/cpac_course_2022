
float AVOID_DIST=6;
float ALIGN_DIST=25;


class Boid{
    Body body;
    color defColor = color(200, 200, 200);
    color contactColor;
    float time_index, dur_frames;
    int nextPoint;
    SoundFile sample;
    
    Boid(Vec2 position){
      this.createBody(position);
      int nextPoint=path.closestTarget(position);
      this.nextPoint=nextPoint;
      
        int i= int(min(random(0, filenames.length), filenames.length-1));    
        this.sample=new SoundFile(app, "sounds/"+filenames[i]);
        
        this.time_index=0;
        this.dur_frames=3*frameRate;
        colorMode(HSB, 255);
        this.contactColor= color(random(0,255),255,255);
        colorMode(RGB, 255);
    }
    void createBody(Vec2 position){
        bd.position.set(position);
        this.body = box2d.createBody(bd);
        this.body.m_mass=1;
        this.body.createFixture(cs, 1);
        this.body.getFixtureList().setRestitution(0.8);
        this.body.setUserData(this);  // this is required to         
    }
    void steer(){  
      Vec2 posW= this.body.getPosition();
      int i=path.closestTarget(posW);
      Vec2 direction = path.getDirection(posW, i);
      this.nextPoint=i;
      
      Vec2 velocity = this.body.getLinearVelocity();
    
      Vec2 steering = direction.sub(velocity);  
      if(DRAW_DEBUG){ 
        strokeWeight(2);
        stroke(255);
        Vec2 posP= W2P(posW);
        line(posP.x, posP.y, path.pointsP[this.nextPoint].x, path.pointsP[this.nextPoint].y);        
      }
      this.applyForce(steering);
    }
    
    void applyForce(Vec2 force){
      this.body.applyForce(force, this.body.getWorldCenter());      
    }
    void contact(){    
      this.play();
      this.changeColor();
    }
    void draw(){
        Vec2 posPixel=box2d.getBodyPixelCoord(this.body);
       
        fill(lerpColor(this.defColor, this.contactColor, this.time_index/this.dur_frames));
        stroke(0);
        strokeWeight(0);        
        ellipse(posPixel.x, posPixel.y, RADIUS_BOID, RADIUS_BOID);
        this.time_index=max(this.time_index-1,0);
    }
    Vec2 getPosition(){
      return this.body.getPosition();
    }
    
    Vec2 getLinearVelocity(){
      return this.body.getLinearVelocity();
    }
    
    void changeColor(){
      this.time_index=this.dur_frames;
    }
    void play(){
     if(! this.sample.isPlaying())      this.sample.play();    
    }
    void update(ArrayList<Boid> boids){
      Vec2 myPosW=this.getPosition();
      Vec2 myVel=this.getLinearVelocity();
      Vec2 otherPosW;
      Vec2 otherVel;
      Vec2 direction;
      Vec2 align_force=new Vec2(0,0);
      Vec2 avoid_force=new Vec2(0,0);
      
      for(Boid other: boids){        
        if(this.body==other.body){continue;}
        otherPosW=other.getPosition();
        direction=otherPosW.sub(myPosW);
        if(direction.length()<AVOID_DIST){
           direction.normalize();
           avoid_force.add(direction.mul(-1));
        }
        else if(direction.length()<ALIGN_DIST){
           otherVel=other.body.getLinearVelocity();
           
           align_force.add(otherVel.sub(myVel));
        }
      }
      if(avoid_force.length()>0){this.applyForce(avoid_force);}
      if(align_force.length()>0){this.applyForce(align_force);}
    }
    
    void kill(){
        box2d.destroyBody(this.body);
    }

   
}
