import processing.video.*;

Movie mov;
PImage prevFrame;
float threshold = 100;
boolean firstFrame = true;

void setup() {
  size(1000, 564);
  noStroke();
  mov = new Movie(this, "video_N.mp4");
  mov.loop();
  
  // Empty image the same size as the video
  prevFrame = createImage(width, height, RGB);
}

void movieEvent(Movie video) {
  if(firstFrame){
    video.read();
    prevFrame.copy(video, 0, 0, width, height, 0, 0, width, height);
    prevFrame.updatePixels();
  }
  else
  {
    prevFrame.copy(video, 0, 0, width, height, 0, 0, width, height);
    prevFrame.updatePixels();
    video.read();
  }
}

void draw() {
  loadPixels();
  mov.loadPixels();
  prevFrame.loadPixels();
  
  checkDiff(mov, prevFrame);
  
  updatePixels();
  
}

void checkDiff(Movie mov, PImage frame) {
  for(int x = 0; x < mov.width; x++) {
    for(int y = 0; y < mov.height; y++) {
      
      int loc = x + y * mov.width; // 1D pixel location
      color current = mov.pixels[loc];
      color prev = frame.pixels[loc];
      
      float r1 = red(current);
      float g1 = green(current);
      float b1 = blue(current);
      float r2 = red(prev);
      float g2 = green(prev);
      float b2 = blue(prev);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      if (diff > threshold) {
        pixels[loc] = color(0);
      } else {
        pixels[loc] = color(255);
      }
      
    }
  }
}
