  final Edge n = new Edge(0, -1);
  final Edge s = new Edge(0, 1);
  final Edge w = new Edge(-1, 0);
  final Edge e = new Edge(1, 0);
  final Edge nw = new Edge(-1, -1);
  final Edge ne = new Edge(1, -1);
  final Edge sw = new Edge(-1, 1);
  final Edge se = new Edge(1, 1);
  
  //reflection is for helping to input graphs
  //Edge reflection is helper for nodeReflection
  final Edge reflectY( Edge edge ) {
    return new Edge( edge.x( ), edge.y( ) * -1 );
  }
  
  final Edge reflectX( Edge edge ) {
    return new Edge( edge.x( ) * -1, edge.y( ) );
  }
  
  

