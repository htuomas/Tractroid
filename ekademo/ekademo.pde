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
   
   translate(0, 50, 0);
   DoRing(10, 20, -50);
   DoRing(20, 40, 0);
   DoRing(10, 20, 50);
}

void DoRing(int ballsOnRing, int spacing, int offset){
  translate(0, offset, 0);
  for(int r=0; r<ballsOnRing; r++){
    sphere(10);
    translate(spacing*-1, spacing*-1, spacing*-1);
    rotateY(TWO_PI/ballsOnRing);
    translate(spacing,spacing,spacing);
  }
  translate(0, -1*offset, 0);
}
