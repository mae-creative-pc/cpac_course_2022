

int lifetime;  // How long should each generation live

Population population;  // Population

int lifecycle;          // Timer for cycle of generation
int recordtime;         // Fastest time to target

Obstacle target;        // Target location

//int diam = 24;          // Size of target

ArrayList<Obstacle> obstacles;  //an array list to keep track of all the obstacles!

void setup() {
  size(800, 200);
  smooth();

  // The number of cycles we will allow a generation to live
  lifetime = 500;

  // Initialize variables
  lifecycle = 0;
  recordtime = lifetime;
  
  target = new Obstacle(width/2-12, 24, 24, 24);

  // Create a population with a mutation rate, and population max
  float mutationRate = 0.01;
  population = new Population(mutationRate, 50);

  // Create the obstacle course  
  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle(300, height/2, width-650, 10));
}

void draw() {
  background(255);

  // Draw the start and target locations
  target.display();


  // If the generation hasn't ended yet
  if (lifecycle < lifetime) {
    population.live(obstacles);
    if ((population.targetReached()) && (lifecycle < recordtime)) {
      recordtime = lifecycle;
    }
    lifecycle++;
    // Otherwise a new generation
  } 
  else {
    lifecycle = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }

  // Draw the obstacles
  for (Obstacle obs : obstacles) {
    obs.display();
  }

  // Display some info
  fill(0);
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifecycle), 10, 36);
  text("Record cycles: " + recordtime, 10, 54);
  
  
}

// Move the target if the mouse is pressed
// System will adapt to new target
void mousePressed() {
  target.location.x = mouseX;
  target.location.y = mouseY;
  recordtime = lifetime;
}
