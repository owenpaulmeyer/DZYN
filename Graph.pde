class Graph {
  private HashMap< Location, Node > grid;
  private Location current;
  private int wide;
  private int high;
  Graph ( int x, int y ) {
    int wide = x;
    int high = y;
    grid = new HashMap< Location, Node > ( );
  }
  
  void current( Location l ) { current = l; }
  
  void addNode( Node n, Location l ) {
    
    grid.put( l, n );
  }
  
  Node trace( Edge e ) {
    current.setXY( current.xloc( ) + e.x( ),
                   current.yloc( ) + e.y( ) );
    return grid.get( current );
  }
  
  Teeth aldente( Node node ) {
    Teeth teeth = new Teeth( );
    for ( Edge edge : node.adjacents( ) ) {
      Tooth tooth = new Tooth( );
      while( node.degree( ) < 3 ) {
        if ( node.degree( ) == 0 ) break;
        node = trace( edge );
        tooth.expandCrown( edge );
      }
      teeth.addAll( roots( tooth ) );
    }
    return teeth;
  }
  
  Teeth roots( Tooth tooth ) {
    Teeth teeth = new Teeth( );
    ArrayList< Edge > adjs = grid.get( current ).adjacents( );
    int size = adjs.size( );
    for ( int i = 0; i < size; ++i )
      for ( int j = i + 1; j < size; ++j ) {
        Tooth t = new Tooth( tooth );
        t.forkRight( adjs.get( i ) );
        t.forkLeft( adjs.get( j ) );
        teeth.addTooth( t );
      }
    return teeth;
  }
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



