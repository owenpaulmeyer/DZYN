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
  final int degree   ( ) { return adjacents.size( ); }
}

