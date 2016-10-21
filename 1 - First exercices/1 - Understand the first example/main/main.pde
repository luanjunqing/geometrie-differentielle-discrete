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

class Vector {
  float x = 0.0;
  float y = 0.0;

  Vector() {
  }

  Vector(float xi,float yi) {
    x = xi;
    y = yi;
  }

  void add(Vector v) {
    x += v.x;
    y += v.y;
  }
  void sub(Vector v) {
    x-= v.x;
    y-= v.y;
  }

  void mult(float c) {
    x = x*c;
    y = y*c;
  }

  float det(Vector v) {
    return (x * v.y - y *v.x);
  }

  float scal(Vector v) {
    return (x * v.x + y *v.y);
  }

  float norm() {
    return(sqrt((x*x+y*y)));
  }
  float normsq() {
    return((x*x+y*y));
  }
  void normalize() {
    float mag = sqrt ((float)(x*x+y*y));
    x = x/mag;
    y= y/mag;
  }
  void rot() {
    float u, v;
    u=x;
    v=y;
    x= -v;
    y = u;
  }
}

class Curve {
  ArrayList<Vector> vertices = new ArrayList<Vector>();
  String loop;  // "yes" or "no"; if yes, indicate only n vertices

  void drawCurve() {
    int n = vertices.size();
    Vector current,next;
    //first: lines
    for(int i=0; i < n-1; i++) {
      current = vertices.get(i);
      next = vertices.get(i+1);
      line((float)current.x,(float)current.y,(float)next.x,(float)next.y);
    }
    current = vertices.get(n-1);  // last point
    if (loop == "yes") {
      next = vertices.get(0);
      line((float)current.x,(float)current.y,(float)next.x,(float)next.y);
    }
    // second: vertices
    for(int i=0; i < n-1; i++) {
      current = vertices.get(i);
      next = vertices.get(i+1);
      //println(i,current.x, current.y);
      ellipse((float)current.x,(float)current.y,vertexSize,vertexSize);
    }
    current = vertices.get(n-1);  // last point
    ellipse((float)current.x,(float)current.y,vertexSize,vertexSize);
  }

  void shift(ArrayList<Vector> shifts) {
    // one should check that the size of both list is the same ...
    //Vector v,s;
    for (int i = 0; i < vertices.size(); i++) {
      Vector v = vertices.get(i);
      Vector s = shifts.get(i);
      //vertices.get(i).add(s);
      v.x += s.x;
      v.y += s.y;
    }
  }
}
