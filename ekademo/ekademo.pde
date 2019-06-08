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
  background(0,0,0);
  int time = millis();
  double bgcolor = moonlander.getValue("background");

  translate(WIDTH/2, HEIGHT/2, 0);
  noStroke();
  lights();
   
   translate(0, 50, 0);
   DoRing(1, 0, -155, time);
   DoRing(1, 0, -95, time);
   DoRing(10, 20, -50, time);
   DoRing(30, 55, 0, time);
   DoRing(10, 20, 50, time);
   DoRing(1, 0, 95, time);
   DoRing(1, 0, 155, time);
}

void DoRing(int ballsOnRing, int spacing, int offset, int time){
  pushMatrix();
  translate(0, offset, 0);
  int size = time%200;
  for(int r=0; r<ballsOnRing; r++){
    sphere(10*sin(TWO_PI/size));
    translate(0, spacing*-1, spacing*-1);
    rotateY(TWO_PI/ballsOnRing*time/840);
    translate(0,spacing,spacing);
  }
  popMatrix();
}
