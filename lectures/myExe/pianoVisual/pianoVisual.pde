import processing.sound.*;
Pulse pulse;

final int framerate = 25;
final int numOctaves = 3;


void setup() {
  size(1000, 600);
  background(90);
  frameRate(framerate);
  
  drawPiano2();
  
  pulse = new Pulse(this);
}

void draw() {
 
}

void mousePressed() {
  float freq = random(200,500);
  pulse.play();
  pulse.amp(0.005);
  pulse.freq(freq);
}

void mouseReleased() {
  pulse.stop();
}

void drawPiano2() {
  for(int i=1; i<7*numOctaves+1; i++) {
    if(i%2==0) fill(0,255,255); else fill(0,128,128);
    rect(i*width/(7*numOctaves+2), height*0.80, 45, 100, 5);   
  }
}

void drawNote(float freq) {
  rect()
}
