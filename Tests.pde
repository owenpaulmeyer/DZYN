void setup ( ) {
  
  /*
  //Generic Pair Test:
  Pair < Integer, Integer > p1 = new Pair < Integer, Integer > ( 1 , 2 );
  println ( p1.fst );
  println ( p1.snd );
  Pair < Integer, Integer > p2 = new Pair < Integer, Integer > ( );
  */
  
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
  println( "Tooth2:" );
  t2.display( );
  println( "Tooth1:" );
  t1.display( );
  println( "idx: " + t1.points( ).indexOf( new Point( nw, 1 ) ) );

}
