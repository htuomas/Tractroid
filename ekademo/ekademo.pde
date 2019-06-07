int HEIGHT = 480;
int WIDTH = 640;

void settings() {
  size(WIDTH, HEIGHT, P3D);
}

void draw() {
  background(0,0,0);
  noStroke();
  lights();
  translate(WIDTH/2, HEIGHT/2, 0);
  sphere(28);
}
