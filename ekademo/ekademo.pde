import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;
int HEIGHT = 480;
int WIDTH = 640;

void settings() {
  size(WIDTH, HEIGHT, P3D);

}

void setup(){
  background(0,0,0);
  moonlander = Moonlander.initWithSoundtrack(this, "Club Diver.mp3", 140, 4);
  moonlander.start();
}

void draw() {
  moonlander.update();
  double bgcolor = moonlander.getValue("background");

  translate(WIDTH/2, HEIGHT/2, 0);
  noStroke();
  lights();
   
   translate(0, 50, 0);
   DoRing(1, 0, -155);
   DoRing(1, 0, -95);
   DoRing(10, 20, -50);
   DoRing(30, 55, 0);
   DoRing(10, 20, 50);
   DoRing(1, 0, 95);
   DoRing(1, 0, 155);
}

void DoRing(int ballsOnRing, int spacing, int offset){
  pushMatrix();
  translate(0, offset, 0);
  for(int r=0; r<ballsOnRing; r++){
    sphere(10);
    translate(0, spacing*-1, spacing*-1);
    rotateY(TWO_PI/ballsOnRing);
    translate(0,spacing,spacing);
  }
  popMatrix();
}
