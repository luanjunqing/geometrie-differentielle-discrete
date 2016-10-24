void mouseClicked() {
  if (make_curve) {
    building_vertices.add(new Vector(mouseX - width / 2, mouseY - height / 2));
    building_curve = new Curve();
    building_curve.loop = false;
    building_curve.vertices = building_vertices;
  }
}

void keyReleased() {
  if (key == 'c') {
    if (make_curve) {
      if (building_vertices.size() >= 3) {
        Curve builded_curve = new Curve();
        builded_curve.loop = true;
        builded_curve.vertices = new ArrayList<Vector>(building_vertices);
        curves.add(builded_curve);
      }

      building_curve = null;
      building_vertices.clear();
    }

    make_curve = !make_curve;
  }
}
