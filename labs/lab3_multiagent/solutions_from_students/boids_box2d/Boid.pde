
float AVOID_DIST=6;
float ALIGN_DIST=25;


class Boid{
    Body body;
    color defColor = color(200, 200, 200);
    int nextPoint;
    int saturation=0;
    int hue=int(random(0,255));
    int brightness=255;
    SoundFile sample;
    Boid(Vec2 position){
      this.createBody(position);
      int nextPoint=path.closestTarget(position);
      this.nextPoint=nextPoint;
      colorMode(HSB, 255);
      
      int i = int(floor(random(0, filenames.length))); 
      this.sample = new SoundFile(app, filenames[i]);
      //this.sample.play();
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
      this.sample.play();
      this.saturation=255;
    }
    void draw(){
        this.saturation-= 255/6; 
        this.saturation=max(this.saturation, 0);
        Vec2 posPixel=box2d.getBodyPixelCoord(this.body);       
        this.defColor=color(this.hue, this.saturation, this.brightness);

        fill(this.defColor);
        stroke(0);
        strokeWeight(0);        
        ellipse(posPixel.x, posPixel.y, RADIUS_BOID, RADIUS_BOID);        
    }
    Vec2 getPosition(){
      return this.body.getPosition();
    }
    
    Vec2 getLinearVelocity(){
      return this.body.getLinearVelocity();
    }
    
    
    void update(ArrayList<Boid> boids){
      Vec2 align_force=new Vec2(0,0);
      Vec2 avoid_force=new Vec2(0,0);
      Vec2 diff, steering;
      float dist;
      for(Boid other: boids){        
        if(this.body==other.body){continue;}
        diff = this.getPosition().sub(other.getPosition());
        dist= diff.length();
        if(dist < AVOID_DIST){
          // update avoid force
          diff.normalize();
          avoid_force.addLocal(diff);          
        }
        else if(dist < ALIGN_DIST){
          // update align force
          steering = other.getLinearVelocity().sub(this.getLinearVelocity());
          steering.normalize();
          align_force.addLocal(steering);
        }
      }
      // apply avoid_force
      this.applyForce(avoid_force);
      // apply align_force
      this.applyForce(align_force);
      
    }
    
    void kill(){
        box2d.destroyBody(this.body);
    }

   
}
