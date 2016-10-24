class Curve {
  List<Vector> vertices = new ArrayList<Vector>();
  boolean loop;  // "yes" or "no"; if yes, indicate only n vertices

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
    if (loop) {
      next = vertices.get(0);
      line((float)current.x,(float)current.y,(float)next.x,(float)next.y);
    }
    // second: vertices
    for(int i=0; i < n-1; i++) {
      current = vertices.get(i);
      next = vertices.get(i+1);
      //println(i,current.x, current.y);
      current.drawVertex();
    }
    current = vertices.get(n-1);  // last point
    current.drawVertex();
  }

  void drawCenterOfMass() {
    this.centerOfMass().drawVertex();
  }

  void drawVectors() {
    int n = vertices.size();
    Vector current;
    for(int i=0; i <= n-1; i++) {
      current = vertices.get(i);
      current.drawVector(this.centerOfMass());
    }
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

  Vector centerOfMass(){
    int n = vertices.size();
    Vector c = new Vector();
    for(int i=0 ; i <= n-1 ; ++i) {
      c.add(vertices.get(i));
    }
    c.mult(1/n);
    return c;
  }
}
