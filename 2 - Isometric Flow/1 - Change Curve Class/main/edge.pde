class Edge {
  float length = 0.0;
  float theta = 0.0;
  Vector first = new Vector();

  Edge() {
  }

  Edge(float _length,float _theta, Vector _first) {
    length = _length;
    theta = _theta;
    first = _first;
  }

  Vector last() {
    float dX = length*cos(radians(theta));
    float dY = length*sin(radians(theta));
    Vector last = new Vector(first.x + dX, first.y + dY);
    return last;
  }

  void drawEdge(){
    // Draw First Vertex
    first.drawVertex();
    // Draw Edge
    line(first.x,first.y,this.last().x,this.last().y);
    // Draw Last Vertex
    this.last().drawVertex();
  }
  void drawEdge(boolean drawLast){
    // Draw First Vertex
    first.drawVertex();
    // Draw Edge
    line(first.x,first.y,this.last().x,this.last().y);
    if (drawLast) {
      // Draw Last Vertex
      this.last().drawVertex();
    }
  }
  void drawEdge(boolean drawFirst, boolean drawLast){
    if (drawFirst) {
      // Draw First Vertex
      first.drawVertex();
    }
    // Draw Edge
    line(first.x,first.y,this.last().x,this.last().y);
    if (drawLast) {
      // Draw Last Vertex
      this.last().drawVertex();
    }
  }
}
