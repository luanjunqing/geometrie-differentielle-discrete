class EdgedCurve {
  Float mainAngle;
  List<Edge> edges = new ArrayList<Edge>();

  void drawEdgedCurve() {
      int n = edges.size();
      Edge current;
      for(int i = 0 ; i < n ; ++i) {
        current = edges.get(i);
        current.drawEdge();
      }
  }

  void shift(ArrayList<Edge> shifts) {

  }

}
