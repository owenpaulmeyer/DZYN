class Teeth extends ArrayList< Tooth > {
  void addTooth( Tooth tooth ) {
    if ( contains( tooth ) ) { //println( "Contains: " + contains( tooth ) );
      Tooth t = get( indexOf( tooth ) );
      t.addPoints( tooth.points( ) );
      t.incrementCount( );
    }
    else add( tooth );
  }
  void addTeeth( Teeth teeth ) {
    for ( Tooth t : teeth )
      addTooth( t );
  }
}

