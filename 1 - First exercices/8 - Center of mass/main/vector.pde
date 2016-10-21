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

  void drawVector(){
    ellipse((float)x,(float)y,vertexSize,vertexSize);
  }
}
