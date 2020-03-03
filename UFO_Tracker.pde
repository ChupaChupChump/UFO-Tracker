import processing.sound.*;
SoundFile music; // initialise sound file as music 
PImage map, ufo; //Use PImage with names map and UFO

int ux; //UFO x Position
int uy;  //ufo Y Position
int uxspeed; //ufo x speed
int uyspeed; //ufo y speed


void setup() {
  size(800, 600); 
  map = loadImage("world-map.jpg");
  
  music = new SoundFile(this, "baddadadoom.wav");
    music.amp(0.05); //adjust volume
    music.play(); // play music

  ufo = loadImage("ufo.png");
  ux = width/2; 
  uy = height/2;
  println("ux = " + ux); 
  println("uy = " + uy); 
  uxspeed = 5; 
  uyspeed = 5;
}

void draw() {
  image(map, 0, 0); // Show map
  
  
  ux += uxspeed;
  if ( ux > width - 110 || ux < 0) {
    uxspeed *= -1;
  }

  uy += uyspeed;
  if ( uy > height - 72 || uy < 0) {
    uyspeed *= -1;
  }
  
  image(ufo, ux, uy); // show ufo and use variables (ux & uy) to control where it is
}
