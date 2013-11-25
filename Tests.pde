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
  Graph design = testInput( );
  design.display( 20, 30, 30 );
  
  Teeth teeth = design.aldente( new Location( 2, 0 ) );
  
  println( teeth );


}



