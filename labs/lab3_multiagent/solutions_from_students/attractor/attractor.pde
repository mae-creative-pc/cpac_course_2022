

AgentMover[] movers;
String[] names; 
int MASS_TO_PIXEL=10;
float mass_mover = 10;
float mass_attractor;
PVector pos_attractor;
float radius_attractor;
float area;
float dist=0;



String[] getFilenames(){
  String path=sketchPath()+"/sounds";
  File dir = new File(path);
  String all_filenames[] = dir.list();
  int N_wavs=0;
  for(int i=0; i<all_filenames.length; i++){
    if (all_filenames[i].endsWith(".wav")){ N_wavs++;}
  }
  String[] wav_filenames= new String[N_wavs];
  int j=0;
  for(int i=0; i<all_filenames.length; i++){
    if (all_filenames[i].endsWith(".wav")){ 
       wav_filenames[j]=sketchPath()+"/sounds/" + all_filenames[i];
       j++;}
  }
  return wav_filenames;
  
}


void setup(){
  names = getFilenames(); 
  
  movers =new AgentMover[names.length];
  
  for(int i= 0; i< names.length ; i++){
    movers[i] = new AgentMover(10, new SoundFile(this, names[i]) ); 
    movers[i].sound.loop();
  }
  
  mass_attractor=random(800, 1200);
  pos_attractor = new PVector(width/2., height/2.);  
  radius_attractor = sqrt(mass_attractor/PI)*MASS_TO_PIXEL;
  
  size(1280, 720);
  background(0);  
}

float computeApplyGravityForce(AgentMover mover){
  PVector attr_force = mover.position.copy();

  attr_force.sub(pos_attractor);
  dist= attr_force.mag();
  float unconstrainedDist = dist;  
  dist=constrain(dist, dist_min,dist_max);
  attr_force.normalize();
  attr_force.mult(-1*mass_attractor*mover.mass/(dist*dist));
  
  mover.applyForce(attr_force); 
  return unconstrainedDist;
}

    
void draw(){
  rectMode(CORNER);
  fill(0,20);
  rect(0,0,width, height);
  fill(200, 0, 200, 40);
  ellipse(pos_attractor.x, pos_attractor.y, 
          radius_attractor, radius_attractor);
  float dist; 
  float gain;
  for(int i = 0; i< movers.length ; i++){
    dist = computeApplyGravityForce(movers[i]);
    gain = 1 / (1+0.01*dist);
    gain = constrain(gain, 0, 1);
    movers[i].sound.amp(gain);
    movers[i].update();
    movers[i].draw();
  }
 
}
