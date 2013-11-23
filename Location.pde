class Location {
  private int x;
  private int y;
  Location ( int _x, int _y ) { x = _x; y = _y; }
  int x( ) { return x; }
  int y( ) { return y; }
  boolean equals( Location l ) { return l.x()==x && l.y()==y; }
}
