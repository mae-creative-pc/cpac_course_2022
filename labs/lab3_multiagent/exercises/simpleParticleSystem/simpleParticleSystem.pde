ParticleSystem ps;
int Nparticles=1000;
void setup(){
  size(1280,720);
  ps=new ParticleSystem();
  for(int p=0; p<Nparticles; p++){
    ps.addParticle();
  }
  background(0);
}

void draw(){
  background(0);
  ps.origin=new PVector(mouseX, mouseY);
  
  ps.draw();
}
