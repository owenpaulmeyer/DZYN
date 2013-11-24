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
  
  void aldente( Node n ) {
  
  }
}
