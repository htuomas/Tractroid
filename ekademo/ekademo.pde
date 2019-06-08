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
   //DoRing(1, 0, -155);
   //DoRing(1, 0, -95);
   //DoRing(10, 20, -50);
   //DoRing(30, 55, 0);
   //DoRing(10, 20, 50);
   //DoRing(1, 0, 95);
   //DoRing(1, 0, 155);
   
   for (int i = 2; i<80; i++) {
     DoRing(NumberOfBalls(i), 500 / i ,  (i - 2) * 15, time);
     DoRing(NumberOfBalls(i), 500 / i , -(i - 2) * 15, time);
}
}

void DoRing(int ballsOnRing, int spacing, int offset, int time){
  pushMatrix();
  translate(0, offset, 0);
  int size = time%210;
  float coefficient = (sin(TWO_PI/size)+1)/(1+1)*(1-0.1)+0.1;
  for(int r=0; r<ballsOnRing; r++){
    sphere(10*coefficient);
    translate(0, spacing*-1, spacing*-1);
    rotateY(TWO_PI/ballsOnRing*time/840);
    translate(0,spacing,spacing);
  }
  popMatrix();
}

int NumberOfBalls(int index) {
  return int(1/(pow(index, 2) - index) * 1000) + 3;
}
