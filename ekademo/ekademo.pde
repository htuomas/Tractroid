import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;
int HEIGHT = 480;
int WIDTH = 640;

PFont font;
float spacingCoeff = 3.2;
float offsetCoeff = 2;
float ballSizeCoeff;
int timer;
float wobbleX;
float wobbleZ;

void settings() {
  //size(WIDTH, HEIGHT, P3D);
  fullScreen(P3D);
}

void setup(){
  ballSizeCoeff = 1;
  colorMode(HSB, 255);
  noCursor();
  background(0,0,0);
  noiseSeed(0);
  moonlander = Moonlander.initWithSoundtrack(this, "Club Diver.mp3", 140, 4);
  moonlander.start();
  font = createFont("AveriaSansLibre-Regular.ttf", 32);
  textFont(font, 50);
}

void draw() {
  moonlander.update();
  background(0,0,0);
  int time = millis();
  double bgcolor = moonlander.getValue("background");
  ballSizeCoeff = (float)moonlander.getValue("ballSizeCoeff");
  timer = moonlander.getIntValue("rowNr");
  wobbleX = moonlander.getIntValue("wobbleX");
  wobbleZ = moonlander.getIntValue("wobbleZ");
  
  background((int) bgcolor);

  pushMatrix();
  translate(width/2, height/2, 0);
  noStroke();
  lights();

  translate(0, 50, 0);
  doRing(1, getSpacingByRingDistance(-4), -155*offsetCoeff, timer);
  doRing(5, getSpacingByRingDistance(-3), -130*offsetCoeff, timer);
  doRing(10, getSpacingByRingDistance(-2), -95*offsetCoeff, timer);
  doRing(30, getSpacingByRingDistance(-1), -50*offsetCoeff, timer);
  doRing(50, getSpacingByRingDistance(0), 0*offsetCoeff, timer);
  doRing(30, getSpacingByRingDistance(1), 50*offsetCoeff, timer);
  doRing(10, getSpacingByRingDistance(2), 95*offsetCoeff, timer);
  doRing(5, getSpacingByRingDistance(3), 130*offsetCoeff, timer);
  doRing(1, getSpacingByRingDistance(4), 155*offsetCoeff, timer);
   
  //println(frameRate);
  if(ballSizeCoeff == 0){
    //exit();
  }
  
  popMatrix();
  if (timer < 34) {
    translate(550, 100);
    text("Tractroid by Siils @ Graffathon 2019", 0, 0, 0);
  }
  
  if ((timer >= 500) && (timer < 720)) {
    translate(550, 80);
    text("jumalauta, adapt, paraguay", 120, 0, 0);
    //text("-", 400, 40, 0);
    text("you've been an inspiration, keep it up!", 20, 50, 0);
    text("thx tlax", 330, 100, 0);
  }
  
  if (timer > 1276) {
    translate(550, 80);
    text("code", 360, 0, 0);
    text("-", 400, 40, 0);
    text("Jeccu & Silenna", 250, 80, 0);
    
    
    text("music", 350, 810, 0);
    text("-", 400, 860, 0);
    textFont(font, 30);
    text("\"Club Diver\" Kevin MacLeod (incompetech.com)", 100, 890, 0);
    text("Licensed under Creative Commons: By Attribution 3.0 License", -20, 920, 0);
    text("http://creativecommons.org/licenses/by/3.0/", 120, 950, 0);
    textFont(font, 50);
    
  }
  
}

float getSpacingByRingDistance(int distance) {
  float spacing;
  if (distance == 0) {
    spacing = 145;  
  } else {
    spacing = 1/(sq(abs(distance)) + 1) * 100;
  }
  return spacing * spacingCoeff;
}

void doRing(int ballsOnRing, float spacing, float offset, int time){
  pushMatrix();
  translate(0, offset, 0);
  //int size = ;
  //float coefficient = (sin(TAU/size)+1)/(1+1)*(2-0.1)+0.1;
  int brightness = (int)((ballSizeCoeff-1) /(3-1)*(255-200)+200);
  
  rotateX(radians(wobbleX));
  rotateZ(radians(wobbleZ));
  
  for(int r=0; r<ballsOnRing; r++){
    int hueManatee = int((noise(time, millis())*256));
    //println("color: " + hueManatee);
    fill(hueManatee, brightness, brightness);
    sphere(20*ballSizeCoeff);
    translate(0, spacing*-1, spacing*-1);
    rotateY(TAU/ballsOnRing *millis()/840);
    translate(0,spacing,spacing);
  }
  popMatrix();
}

int NumberOfBalls(int index) {
  return int(1/(pow(index, 2) - index) * 100) + 3;
}
