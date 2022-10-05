class Blanket {
  ArrayList<Particle> particles;
  ArrayList<Connection> springs;

  Blanket() {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<Connection>();

    int w = 100;
    int h = 30;

    float len = 5;
    float strength = 0.5;
    //float strength = 2;

    for(int y=0; y< h; y++) {
      for(int x=0; x < w; x++) {

        Particle p = new Particle(new Vec2D(width/2+x*len-w*len/2,y*len));
        physics.addParticle(p);
        particles.add(p);

        if (x > 0) {
          Particle previous = particles.get(particles.size()-2);
          Connection c = new Connection(p,previous,len,strength);
          physics.addSpring(c);
          springs.add(c);
        }

        if (y > 0) {
          Particle above = particles.get(particles.size()-w-1);
          Connection c1=new Connection(p,above,len,strength);
          physics.addSpring(c1);
          springs.add(c1);
        }
      }
    }

    Particle topleft= particles.get(0);
    topleft.lock();

    Particle topright = particles.get(w-1);
    topright.lock();
    
    //Particle middle= particles.get(5*w+50);
    //middle.lock();
  }

  void display() {
    for (Connection c : springs) {
      c.display();
    }
  }
}
