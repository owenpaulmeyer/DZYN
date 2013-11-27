class GGraph {
  HashMap< Location, GNode > grid;
  int wide;
  int high;
  
  GGraph ( ) {
    grid = new HashMap< Location, GNode > ( );
    wide = 0;
    high = 0;
  }
  
  GGraph ( int x, int y ) {
    wide = x;
    high = y;
    grid = new HashMap< Location, GNode > ( );
    initialize( );
  }
  
  void addNode( int xloc, int yloc, GNode n ) {
    Location l = new Location( xloc, yloc );
    grid.put( l, n );
  }
  
  void initialize( ) {
    for ( int x = 0; x < wide; ++x )
      for ( int y = 0; y < high; ++y ) {
        addNode( x, y, new GNode( ) );
      }
  }

  //the weight of the other side of the edge @ param edge
  Ratio returnWeight( Location loc, Edge edge ) {
    Location l = trace( loc, edge );
    GNode next = grid.get( l );
    return next.weight( edge.inverse( ) );
  }
  
  
  Location trace ( Location loc, Edge e ) {
    Location l = loc.trace( e );
    if ( l.xloc( ) < 0 ) l.xloc( wide-1 );
    if ( l.xloc( ) == wide ) l.xloc( 0 );
    if ( l.yloc( ) < 0 ) l.yloc( high-1 );
    if ( l.yloc( ) == high ) l.yloc( 0 );
    return l;
  } 

  void setSeed ( Seed seed, Location loc ) {
    GNode node = grid.get( loc );
    for ( WeightedEdge edge : seed ) {
      node.balance( edge );
      Location l = trace( loc, edge );
      GNode opNode = grid.get( l );
      Edge opEdge  = edge.inverse( );
      opNode.balance ( new WeightedEdge( opEdge, edge.weight( ) ) ); 
    } 
  }

  void setTooth( Tooth tooth, Location loc ) {
    double scale = fitTooth( tooth, loc );
    
  }
  
  void setPoints( Tooth tooth, Location loc ) {
    GNode node = grid.get( loc );
    ArrayList< Point > points = tooth.points( );
    for ( Point p : points ) {
      WeightedEdge we = new WeightedEdge( p.edge( ), tooth.pointWeight( p ) );
      node.balance( we );
    }
  }

  double fitTooth( Tooth tooth, Location loc ) {
    double weight = 1.0;
    GNode currentNode = grid.get( loc );
    for ( int i = 0; i < tooth.crown( ).size( ); ++i ) {
      Edge edge = tooth.crown( ).get( i );
      double w1 = currentNode.weight( edge ).eval( );
      double w2 = returnWeight( loc, edge ).eval( );
      weight *= w1 * w2;
    }
    double left =  currentNode.weight( tooth.root( ).left( )  ).eval( );
    double right = currentNode.weight( tooth.root( ).right( ) ).eval( );
    return weight * left * right;
  }

  String toString( ) {
    String s = "";
    Set keys = grid.keySet( );
    for ( Object o : keys ) {
      Location loc = ( Location ) o;
      GNode node = grid.get( loc );
      s += "Location:  " + loc;
      s += node + "\n";
    }
    return s;
  }

  
  
}


