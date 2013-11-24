class Location {
  private int x;
  private int y;
  
  Location ( int _x, int _y ) { x = _x; y = _y; }
  
  final int x( ) { return x; }
  final int y( ) { return y; }
  
  public boolean equals( Object obj ){
    if ( obj == this ) return true;    
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;    
    Location l = ( Location ) obj;    
    return l.x()==x && l.y()==y;
  }
}
