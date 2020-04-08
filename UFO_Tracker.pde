////////////////////////////////////////////////////////// Boxed to look pretty
////////// UFO TRACKER 2000 BY Mitchell Charity //////////
////////// A Program to assist in tracking UFOs //////////
//////////--------------------------------------//////////
//////// To compile this program using processing ////////
////// File -> Export Application -> Select your OS //////
///////// If you have Java uncheck "Embdded Java" ////////
//////////--------------------------------------//////////
////////// To run the program, enter the folder //////////
///////// that was created after clicking export /////////
//////////// Open the UFO_Tracker Application ////////////
////////////// and then enjoy tracking UFOs //////////////
//////////////////////////////////////////////////////////

//Using Processing,sound library
import processing.sound.*;
SoundFile music, boing; // initialise sound file as music 
PImage map, ufo; //Use PImage with names map and UFO
PVector location = new PVector(400, 300);
PVector velocity = new PVector(5, 5);
boolean mousepressed = false;

void setup() {
  print("Welcome to [UFO_Tracker 2000] by M. Charity");
  size(800, 600); 
  map = loadImage("world-map.jpg"); //MAP image https://geology.com/world/world-map.shtml
  music = new SoundFile(this, "ufoFlying.mp3"); // creepy ufo sounds https://geology.com/world/world-map.shtml
  boing = new SoundFile(this, "boing.mp3"); //boing sound http://www.orangefreesounds.com/boing-sound/ <- Boing sound
  ufo = loadImage("ufo.png"); //UFO image
  frameRate(25);
  textSize(32);
  textAlign(CENTER, BOTTOM);
  music.play(); //Plays the sound file at startup
  music.amp(0.25); // Changes volume
}

void draw() {
  image(map, 0, 0); // Show map
  fill(0, 255, 0);
  text("UFO Tracker 2000", width/2, height/8);
  movementAndEdges();
  image(ufo, location.x, location.y); // show ufo and use variables (ux & uy) to control where it is
}

void mousePressed() { // Changes ufo image
  if (!mousepressed) {
    ufo = loadImage("ufo.png"); //UFO alt image
    mousepressed = true;
  } else if (mousepressed) {
    ufo = loadImage("KritaSaucer.gif"); //UFO image
    mousepressed = false;
  }
}

void movementAndEdges() { // Control the velocity and location of the UFO as well as edge detection
  location.add(velocity); 
  if ( location.x >= width - ufo.width || location.x <= 0) {
    velocity.x *= -1;
    boing.play();
    direction();
  }
  if ( location.y >= height - ufo.height || location.y <= 0) {
    velocity.y *= -1;
    boing.play();
    direction();
  }
}

void direction() { //Detects direction and prints results to console.
  if (velocity.x > 0 & velocity.y < 0) { 
    println("Heading North-East");
  } 
  if (velocity.x > 0 & velocity.y > 0) { 
    println("Heading South-East");
  } 
  if (velocity.x < 0 & velocity.y > 0) { 
    println("Heading South-West");
  }  
  if (velocity.x < 0 & velocity.y < 0) { 
    println("Heading North-West");
  }
}
