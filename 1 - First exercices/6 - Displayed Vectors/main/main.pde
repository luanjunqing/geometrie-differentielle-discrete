/*
This sketch builds on a prior work, "rotating_polygon", created by Pascal Romon
http://cd3d.sketchpad.cc/sp/pad/view/ro.4lJDWzx$jTVZvDA/rev.20
*/

import java.util.List;
import java.util.ArrayList;

/*
This simple program evolves a centered regular polygon by the flow of
the circular field
Pascal Romon 2016-09-30
*/


int vertexSize = 10;  // circle size for drawing vertices
Curve C;
int n;
float tau = 0.1;
int pause = 0;  // control the mouse


boolean make_curve;
List<Curve> curves;
Curve building_curve;
List<Vector> building_vertices;

void setup() {
  frameRate(10);
  size(800, 800);
  background(100);
  n = 8;

  C = regularPolygon(n, 50, 50, 40);


  // To create new curves with the mouse.
  curves = new ArrayList<Curve>();
  building_curve = null;
  building_vertices = new ArrayList<Vector>();
  make_curve = false;
}

void draw() {
  translate(width/2, height/2);  // sets the origin of the coordinates in the center of the frame
  background(100);

  // Display the custom curves.
  if (building_curve != null) {
      building_curve.drawCurve();
  }

  for (Curve curve: curves) {
    curve.drawCurve();
    curve.drawCenterOfMass();
    curve.drawVectors();
  }
}

Curve regularPolygon(int n, float xo, float yo, float radius) {
  Curve C = new Curve();
  C.loop = true;  // the curve is closed
  for (int i=0; i < n; i++) {
    Vector v = new Vector(xo + radius*cos(i*TWO_PI/n),yo + radius*sin(i*TWO_PI/n));
    C.vertices.add(v);
  }
  return(C);
}
