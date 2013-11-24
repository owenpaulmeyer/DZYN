class Teeth extends ArrayList< Tooth > {
  void addTooth( Tooth tooth ) {
    if ( contains( tooth ) ) {
      Tooth t = get( indexOf( tooth ) );
      t.addPoints( tooth.points( ) );
      t.incrementCount( );
    }
    else add( tooth );
  }
}

