Planet sun, moon;
PVector velsun, velmoon;
color csun, cmoon;

void setup(){
  size(800, 600);
  frameRate(60);
  background(0);
  
  velsun = new PVector(0,0);
  velmoon = new PVector(4, 0.2);

  csun = color(252, 229, 112); 
  cmoon = color(100, 51, 0);
  
  sun = new Planet(width/2, height/2, velsun, 100, 200, csun);
  moon = new Planet(200, 200, velmoon, 40, 100, cmoon);
} 

void draw(){
  background(0);
  
  sun.gravity(moon);
  sun.update();
  
  moon.gravity(sun);
  moon.update();  
  
  moon.drawer();
  sun.drawer();  
} 
