class Node {

  private ArrayList< Edge > adjacents;
  
  Node (  ) { adjacents = new ArrayList< Edge >( ); }
  
  Node ( ArrayList< Edge > adj ) {
    adjacents = adj;
  }
  
  void addAdj( Edge adj ) { adjacents.add( adj ); }
  
  final ArrayList< Edge > adjacents( ) { return adjacents; }

}

class GNode {
  //NodeWeight usage is unknown at this point
  private double weight = 1.0;
  private ArrayList< WeightedEdge > adjacents;
  
  GNode (  ) { adjacents = new ArrayList< WeightedEdge >( ); }
  
  GNode ( ArrayList< WeightedEdge > adj ) {
    adjacents = adj;
  }
  
  void addAdj( WeightedEdge adj ) { adjacents.add( adj ); }
  
  final double weight( ) { return weight; }
  final ArrayList< WeightedEdge > adjacents( ) { return adjacents; }

}

class Location {
  int x;
  int y;
  
  Location( ) { }
  Location( int _x, int _y ) { x = _x; y = _y; }
  
  void setXY( int _x, int _y ) { x = _x; y = _y; }
  
  final int xloc( ) { return x; }
  final int yloc( ) { return y; }

  public boolean equals( Object obj ){
    if ( obj == this ) return true;    
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;    
    Location l = ( Location ) obj;
    return l.xloc( ) == xloc( ) && l.yloc( ) == yloc( );
  }
}
