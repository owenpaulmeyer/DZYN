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

/*
  //Graph Tests
  Graph design = testInput( );
  design.display( 20, 30, 30 );
  
  Teeth teeth = design.extract( );
  println( teeth );
*/

/*
  Teeth teeth2 = design.aldente( new Location ( 1, 4 ) );
  println( "2: " + teeth2.size( ) + teeth2 );
  Tooth th = new Tooth( );
  th.addPoint( nw );
  th.addPoint( se );
  th.addPoint( w );
  th.expandCrown( n );
  th.forkRight( sw );
  th.forkLeft( ne );
  teeth2.addTooth( th );
  println( "2: " + teeth2.size( ) + teeth2 );
*/

  GGraph graph = new GGraph ( 5, 5 );
  Graph input = testInput( );
  Teeth teeth = input.extract( );
  Ratio weight = new Ratio( 1, 1 );
  
  Seed seed = new Seed( );
  
  seed.add( new WeightedEdge( n, weight ) );
  seed.add( new WeightedEdge( s, weight ) );
  seed.add( new WeightedEdge( w, weight ) );
  seed.add( new WeightedEdge( e, weight ) );
  seed.add( new WeightedEdge( nw, weight ) );
  seed.add( new WeightedEdge( ne, weight ) );
  seed.add( new WeightedEdge( sw, weight ) );
  seed.add( new WeightedEdge( se, weight ) );
  
  graph.setSeed( seed, new Location( 2, 2 ) );
  
  Tooth th = new Tooth( );
  th.addPoint( nw );
  th.addPoint( se );
  th.addPoint( w );
  th.expandCrown( n );
  th.forkRight( e );
  th.forkLeft( w );
  //println( "trace: " + graph.trace( new Location ( 0, 0 ), n ) );
  GNode gnode = new GNode( );
  gnode = graph.setTeeth( teeth, new Location ( 3, 1 ) );
  println( "gnode: " + gnode );
  //println( graph );

}



