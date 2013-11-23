class Location {
  private int x;
  private int y;
  
  Location ( int _x, int _y ) { x = _x; y = _y; }
  
  final int x( ) { return x; }
  final int y( ) { return y; }
  
  boolean equals( Location l ) { return l.x()==x && l.y()==y; }
}
