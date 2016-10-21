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

      // float deltax = ( v.x - s.x >= 0 ) ? v.x - s.x : s.x - v.x;
      // float deltay = ( v.y - s.y >= 0 ) ? v.y - s.y : s.y - v.y;
      //
      // if ( deltax > epsilon && deltay > epsilon ) {
      //   v.add(s);
      // }

      v.add(s);

    }
  }
}
