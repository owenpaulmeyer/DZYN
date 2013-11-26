class Node {

  private ArrayList< Edge > adjacents;
  
  Node (  ) { adjacents = new ArrayList< Edge >( ); }
  
  Node ( ArrayList< Edge > adj ) {
    adjacents = adj;
  }
  
  Node ( Node n ) {
    adjacents = new ArrayList< Edge > ( );
    for ( Edge e : n.adjacents( ) )
      adjacents.add( e );
  }
  
  void addEdge( Edge adj ) { adjacents.add( adj ); }
  
  final ArrayList< Edge > adjacents( ) { return adjacents; }
  final int degree   ( ) { return adjacents.size( ); }
  
  //for assisting graph inputting
  Node nodeReflectX( ) {
    ArrayList< Edge > adj = new ArrayList< Edge >( );
    for ( Edge e : adjacents( ) ) {
      adj.add( reflectX( e ) );
    }
    return new Node( adj );
  }
  //for assisting graph inputting
  Node nodeReflectY( ) {
    ArrayList< Edge > adj = new ArrayList< Edge >( );
    for ( Edge e : adjacents( ) ) {
      adj.add( reflectY( e ) );
    }
    return new Node( adj );
  }
  
  String toString( ) {
    String s = "";
    for ( Edge e : adjacents ) s += " " + e;
    return s;
  }
}

class GNode {
  //NodeWeight usage is unknown at this point
  private double weight = 1.0;
  private State state = State.Open;
  private Ratio north     = new Ratio( 0, 0 );
  private Ratio south     = new Ratio( 0, 0 );
  private Ratio east      = new Ratio( 0, 0 );
  private Ratio west      = new Ratio( 0, 0 );
  private Ratio northeast = new Ratio( 0, 0 );
  private Ratio northwest = new Ratio( 0, 0 );
  private Ratio southeast = new Ratio( 0, 0 );
  private Ratio southwest = new Ratio( 0, 0 );

  

  void balance ( GNode node ) {
    north.balance    ( node.north     );
    south.balance    ( node.south     );
    east.balance     ( node.east      );
    west.balance     ( node.west      );
    northeast.balance( node.northeast );
    northwest.balance( node.northwest );
    southeast.balance( node.southeast );
    southwest.balance( node.southwest );
  }
  
  Ratio weight( Edge e ) {
    if(      e.isNorth()  ) return north;
    else if( e.isSouth()  ) return south;
    else if( e.isWest()   ) return west;
    else if( e.isEast()   ) return east;
    else if( e.isNorthW() ) return northwest;
    else if( e.isNorthE() ) return northeast;
    else if( e.isSouthW() ) return southwest;
    else if( e.isSouthE() ) return southeast;
    else return new Ratio( 0, 0 );
  }
  
  void closeState( ) { state = State.Closed; }
  void openState ( ) { state = State.Open; }
  
  final double nodeWeight( ) { return weight; }

}


  
