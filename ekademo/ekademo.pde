int HEIGHT = 480;
int WIDTH = 640;

void settings() {
  size(WIDTH, HEIGHT, P3D);

}

void setup(){
  background(0,0,0);

}

void draw() {
  translate(WIDTH/2, HEIGHT/2, 0);
  noStroke();
  lights();
  
  //sphere(10);
  
  int ballsOnRing = 10;
  int spacing = 50;
  int offset = 80;
  
  translate(offset, offset, offset);
  for(int r=0; r<ballsOnRing; r++){
    sphere(10);
    translate(spacing*-1, spacing*-1, spacing*-1);
    rotateX(TWO_PI/10);
    translate(spacing,spacing,spacing);
  }
}
