class Node {
  
  //Weight usage is unknown at this point
  private double weight = 1.0;
  private Location loc;
  private ArrayList< Pair< Edge, Double > > adjacents;
  
  Node ( Location l ) { loc = l; }
  
  Node ( Location l, ArrayList< Pair< Edge, Double > > adj ) {
    loc = l;
    adjacents = adj;
  }
  
  void addAdj( Pair< Edge, Double > adj ) { adjacents.add( adj ); }
  
  final Location loc( ) { return loc; }
  
  final double weight( ) { return weight; }
  
  final ArrayList< Pair< Edge, Double > > adjacents( ) { return adjacents; }
  
  boolean equals ( Node n ) {
    return n.loc( ).equals( n.loc() );
  }
}
