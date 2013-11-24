void setup ( ) {
  size( 400, 400 );
  smooth( );
  strokeWeight( 2 );
/*
  //Generic Pair Test:
  Pair < Integer, Integer > p1 = new Pair < Integer, Integer > ( 1 , 2 );
  println ( p1.fst );
  println ( p1.snd );
  Pair < Integer, Integer > p2 = new Pair < Integer, Integer > ( );
*/
  
/*  
  //Tooth constructing, copying, mutating Tests
  Tooth t1 = new Tooth ( );
  t1.addPoint( nw );
  t1.addPoint( se );
  t1.addPoint( w );
  t1.expandCrown( s );
  t1.forkRight( s );
  t1.forkLeft( sw );
  Tooth t2 = new Tooth ( t1 );
  t1.addPoint( w );
  t2.addPoint( nw );
  print( "Tooth2:" );
  println( t2 );
  print( "Tooth1:" );
  println( t1 );
*/

/*
  //Teeth Test
  Teeth teeth = new Teeth ( ) ;
  Tooth t1 = new Tooth( );
  t1.addPoint( nw );
  t1.addPoint( se );
  t1.addPoint( w );
  t1.expandCrown( s );
  t1.forkRight( s );
  t1.forkLeft( sw );
  Tooth t2 = new Tooth( );
  t2.addPoint( n );
  t2.addPoint( sw );
  t2.addPoint( e );
  t2.expandCrown( sw );
  t2.forkRight( s );
  t2.forkLeft( sw );
  teeth.addTooth( t1 );
  teeth.addTooth( t2 );
  println( "Teeth:" );
  println( teeth );
  Tooth t3 = new Tooth( t1 );
  Tooth t4 = new Tooth( t2 );
  t3.addPoint( nw );
  t4.addPoint( ne );
  teeth.addTooth( t3 );
  teeth.addTooth( t4 );
  t4.expandCrown( s );

  teeth.addTooth( t4 );
  println( "Teeth:" );
  println( teeth );
*/

/*
  //JSON Test
  Tooth tooth = new Tooth( );
  tooth.addPoint( nw );
  tooth.addPoint( s );
  tooth.expandCrown( e );
  tooth.forkRight( se );
  tooth.forkLeft( e );
  JSONObject jsn = tooth.toJSON( );
  print( jsn );
*/

  //Graph Tests
  Graph design = new Graph( 2, 2 );
  Node n1 = new Node( );
  n1.addEdge( s );
  n1.addEdge( e );
  n1.addEdge( se );
  design.addNode( 0, 0, n1 );
  design.addNode( 0, 4, n1.nodeReflectY( ) );
  design.addNode( 4, 0, n1.nodeReflectX( ) );
  design.addNode( 4, 4, n1.nodeReflectX( ).nodeReflectY( ) );
  Node n2 = new Node( );
  n2.addEdge( n );
  n2.addEdge( s );
  n2.addEdge( e );
  design.addNode( 0, 1, n2 );
  design.addNode( 0, 2, n2 );
  design.addNode( 0, 3, n2 );
  design.addNode( 4, 1, n2.nodeReflectX( ) );
  design.addNode( 4, 2, n2.nodeReflectX( ) );
  design.addNode( 4, 3, n2.nodeReflectX( ) );
  Node n3 = new Node( );
  n3.addEdge( w );
  n3.addEdge( e );
  n3.addEdge( s );
  design.addNode( 1, 0, n3 );
  design.addNode( 2, 0, n3 );
  design.addNode( 3, 0, n3 );
  design.addNode( 1, 4, n3.nodeReflectY( ) );
  design.addNode( 2, 4, n3.nodeReflectY( ) );
  design.addNode( 3, 4, n3.nodeReflectY( ) );
  Node n4 = new Node( n1 );
  n4.addEdge( nw );
  design.addNode( 3, 3, n4 );
  design.addNode( 1, 3, n4.nodeReflectX( ) );
  design.addNode( 3, 1, n4.nodeReflectY( ) );
  design.addNode( 1, 1, n4.nodeReflectY( ).nodeReflectX( ) );
  Node n5 = new Node( n4 );
  n5.addEdge( n );
  n5.addEdge( w );
  n5.addEdge( sw );
  n5.addEdge( ne );
  design.addNode( 2, 2, n5 );
  Node nv = new Node( );
  nv.addEdge( n );
  nv.addEdge( s );
  design.addNode( 2, 1, nv );
  design.addNode( 2, 3, nv );
  Node nh = new Node( );
  nh.addEdge( w );
  nh.addEdge( e );
  design.addNode( 1, 2, nh );
  design.addNode( 3, 2, nh );


  design.display( 40, 30, 30 );
}



