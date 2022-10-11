ParticleSystem ps;
int Nparticles=1000;
PImage img;

void setup(){
  size(1280,720, P2D);
  img=loadImage("texture.png");

  ps=new ParticleSystem();
  for(int p=0; p<Nparticles; p++){
    ps.addParticle();
  }
  background(0);
  
  minim= new Minim(this);
   mic = minim.getLineIn(Minim.MONO, frameLength);
   fft = new FFT(mic.bufferSize(), mic.sampleRate());
   fft.window(FFT.HAMMING);
  
}

void draw(){
  blendMode(ADD);
  background(0);
  computeEnergy();
  
 
  
  ps.draw();
}
