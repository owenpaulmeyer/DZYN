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
  private WeightedEdge north     = new WeightedEdge( n );
  private WeightedEdge south     = new WeightedEdge( s );
  private WeightedEdge east      = new WeightedEdge( e );
  private WeightedEdge west      = new WeightedEdge( w );
  private WeightedEdge northeast = new WeightedEdge( ne );
  private WeightedEdge northwest = new WeightedEdge( nw );
  private WeightedEdge southeast = new WeightedEdge( se );
  private WeightedEdge southwest = new WeightedEdge( sw );

  GNode (  ) { }

  void balance ( GNode node ) {
    north.balance( node.north );
    south.balance( node.south );
    east.balance ( node.east  );
    west.balance ( node.west  );
    northeast.balance( node.northeast );
    northwest.balance( node.northwest );
    southeast.balance( node.southeast );
    southwest.balance( node.southwest );
  }
  
  void closeState( ) { state = State.Closed; }
  void openState ( ) { state = State.Open; }
  
  final double weight( ) { return weight; }

}


  
