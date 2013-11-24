class Node {

  private int xloc;
  private int yloc;
  private ArrayList< Edge > adjacents;
  
  Node ( Location l ) { loc = l; }
  
  Node ( Location l, ArrayList< Edge > adj ) {
    loc = l;
    adjacents = adj;
  }
  
  void addAdj( Edge adj ) { adjacents.add( adj ); }
  
  final Location loc( ) { return loc; }
  
  final ArrayList< Edge > adjacents( ) { return adjacents; }
  
  boolean equals ( Node n ) {
    return n.loc( ).equals( n.loc() );
  }
}

class GNode {
  //Weight usage is unknown at this point
  private int xloc;
  private int yloc;
  private double weight = 1.0;
  private ArrayList< WeightedEdge > adjacents;
  
  GNode ( Location l ) { loc = l; }
  
  GNode ( Location l, ArrayList< WeightedEdge > adj ) {
    loc = l;
    adjacents = adj;
  }
  
  void addAdj( WeightedEdge adj ) { adjacents.add( adj ); }
  
  final Location loc( ) { return loc; }
  final double weight( ) { return weight; }
  final ArrayList< WeightedEdge > adjacents( ) { return adjacents; }
  
  boolean equals ( Node n ) {
    return n.loc( ).equals( n.loc() );
  }
}
