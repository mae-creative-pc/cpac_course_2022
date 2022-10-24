
ParticleSystem ps;
int Nparticles = 1000;

void setup(){
  size(1280, 720);
  frameRate(60);
  background(0);
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  for (int p=0; p < Nparticles; p++){
    ps.addParticle();
  }
}

void draw(){
  background(0);
  ps.origin=new PVector(mouseX, mouseY);
  ps.run();
}
