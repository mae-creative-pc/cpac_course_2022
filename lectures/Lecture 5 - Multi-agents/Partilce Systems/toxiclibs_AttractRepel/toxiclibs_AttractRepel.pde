import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;
Attractor attractor2;

VerletPhysics2D physics;

void setup () {
  //size (800, 200);
  fullScreen();
  smooth();
  physics = new VerletPhysics2D ();
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 1000; i++) {
    particles.add(new Particle(new Vec2D(random(width),random(height))));
  }
  
  attractor = new Attractor(new Vec2D(width/2-100,height/2));
  attractor2 = new Attractor(new Vec2D(width/2,height/2));
}


void draw () {
  background (255);  
  physics.update();

  attractor.display();
  attractor2.display();
  for (Particle p: particles) {
    p.display();
  }
  
  if (mousePressed) {
    attractor.lock();
    attractor.set(mouseX,mouseY);
  } else {
    attractor.unlock();
  }
}
