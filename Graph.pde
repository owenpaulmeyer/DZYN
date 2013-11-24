class Graph {
  private HashMap< Location, Node > grid;
  private Location current = null;
  private int wide;
  private int high;
  Graph ( int x, int y ) {
    int wide = x;
    int high = y;
    grid = new HashMap< Location, Node > ( );
  }
  
  void current( Location l ) { current = l; }
  
  //first Node added sets the current to it's location for display testing purposes
  void addNode( int xloc, int yloc, Node n ) {
    Location l = new Location( xloc, yloc );
    grid.put( l, n );
    if( current == null ) current ( l );
  }

  Node trace( Edge e ) {
    current = new Location( current.xloc( ) + e.x( ),
                   current.yloc( ) + e.y( ) );
    return grid.get( current );
  }
  //need to add a traversal of all nodes in the grid to aldentify( )
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
  
  void display( int scale, int xS, int yS ){
    Iterator itr = grid.entrySet().iterator();
    while (itr.hasNext()) {
        Map.Entry pairs = (Map.Entry)itr.next();
        //System.out.println(pairs.getKey() + " = " + pairs.getValue());
        Location l = (Location)pairs.getKey( );
        Node     n = (Node)pairs.getValue( );
        float _x = xS + l.xloc( ) * scale;
        float _y = yS + l.yloc( ) * scale;
        for ( Edge e : n.adjacents( ) ) {
          float _xto = _x + e.x( )*scale/2.3;
          float _yto = _y + e.y( )*scale/2.3;
          line( _x, _y, _xto, _yto  );
        }
        strokeWeight( 1 );
        ellipse( _x, _y, 8,8 );
        strokeWeight( 2 );
        //itr.remove(); // avoids a ConcurrentModificationException
    }  
  }
}

class Location {
  int x;
  int y;
  
  Location( ) { }
  Location( int _x, int _y ) { x = _x; y = _y; }
  
  
  final int xloc( ) { return x; }
  final int yloc( ) { return y; }
  
  
  public boolean equals( Object obj ){
    if ( obj == this ) return true;    
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;    
    Location l = ( Location ) obj;
    return l.xloc( ) == xloc( ) && l.yloc( ) == yloc( );
  }
}



