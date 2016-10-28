
import java.util.List;
import java.util.ArrayList;


int vertexSize = 10;  // circle size for drawing vertices
float tau = 0.1;
int pause = 0;  // control the mouse
Vector i;
Edge E;

void setup() {
  frameRate(10);
  size(300, 300);
  background(100);
  i = new Vector(45.0, 60.0);
  E = new Edge(78.0, 45.0, i);

}

void draw() {
  translate(width/2, height/2);  // sets the origin of the coordinates in the center of the frame
  background(100);
  E.drawEdge(false);
}
