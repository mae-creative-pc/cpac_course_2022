import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  frameRate(60);
  oscP5 = new OscP5(this, 57120);
}

void draw() {
  background(0);  
  
}

void oscEvent(OscMessage message) {
  
}
