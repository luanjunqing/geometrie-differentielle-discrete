/*
This simple program evolves a centered regular polygon by the flow of
the circular field
Pascal Romon 2016-09-30
*/


int vertexSize = 6;  // circle size for drawing vertices
Curve C;
int n;
float tau = 0.01;
int pause = 0;  // control the mouse

void setup() {
  frameRate(60);
  size(400, 400);
  background(100);
  n = 6;

  C = regularPolygon(n, 75, 75, 50);
}

void draw() {
  translate(width/2, height/2);  // sets the origin of the coordinates in the center of the frame
  if (pause == 0) {
    background(100);
    C.drawCurve();
    ArrayList<Vector> ts = new ArrayList<Vector>();
    for (int i = 0; i < n; i++) {
      Vector v = new Vector();
      v.x = C.vertices.get(i).x;
      v.y = C.vertices.get(i).y;
      v.rot();
      v.mult(tau);
      ts.add(v);
    }
    C.shift(ts);
  }
}

void mouseClicked() {
  // clicking pause and restarts the process
  pause = 1 - pause;
}

Curve regularPolygon(int n, float xo, float yo, float radius) {
  Curve C = new Curve();
  C.loop = "yes";  // the curve is closed
  for (int i=0; i < n; i++) {
    Vector v = new Vector(xo + radius*cos(i*TWO_PI/n),yo + radius*sin(i*TWO_PI/n));
    C.vertices.add(v);
  }
  return(C);
}
