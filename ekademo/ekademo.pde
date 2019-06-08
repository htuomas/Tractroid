import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;
int HEIGHT = 480;
int WIDTH = 640;

float spacingCoeff = 0.8;
float offsetCoeff = 0.5;

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
  background((int) bgcolor);

  translate(WIDTH/2, HEIGHT/2, 0);
  noStroke();
  lights();
   
  translate(0, 50, 0);
  doRing(1, getSpacingByRingDistance(-4), -155*offsetCoeff, time);
  doRing(5, getSpacingByRingDistance(-3), -130*offsetCoeff, time);
  doRing(10, getSpacingByRingDistance(-2), -95*offsetCoeff, time);
  doRing(30, getSpacingByRingDistance(-1), -50*offsetCoeff, time);
  doRing(50, getSpacingByRingDistance(0), 0*offsetCoeff, time);
  doRing(30, getSpacingByRingDistance(1), 50*offsetCoeff, time);
  doRing(10, getSpacingByRingDistance(2), 95*offsetCoeff, time);
  doRing(5, getSpacingByRingDistance(3), 130*offsetCoeff, time);
  doRing(1, getSpacingByRingDistance(4), 155*offsetCoeff, time);
   
  //for (int i = 2; i<10; i++) {
  //  doRing(NumberOfBalls(i), 500 / i ,  (i - 2) * 15, time);
  //  doRing(NumberOfBalls(i), 500 / i , -(i - 2) * 15, time);
  //}
  println(frameRate);
}

float getSpacingByRingDistance(int distance) {
  float spacing;
  if (distance == 0) {
    spacing = 145;  
  } else {
    //spacing = 1/(log(abs(distance)) + 1) * 100;
    spacing = 1/(sq(abs(distance)) + 1) * 100;
  }
  return spacing * spacingCoeff;
}

void doRing(int ballsOnRing, float spacing, float offset, int time){
  pushMatrix();
  translate(0, offset, 0);
  int size = time%210;
  float coefficient = (sin(TWO_PI/size)+1)/(1+1)*(1-0.1)+0.1;
  
  for(int r=0; r<ballsOnRing; r++){
    sphere(5*coefficient);
    translate(0, spacing*-1, spacing*-1);
    rotateY(TWO_PI/ballsOnRing*time/840);
    translate(0,spacing,spacing);
  }
  popMatrix();
}

int NumberOfBalls(int index) {
  return int(1/(pow(index, 2) - index) * 100) + 3;
}
