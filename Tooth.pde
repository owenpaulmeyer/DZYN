class Tooth {
  private Line crown = new Line( );
  private Fork root = new Fork( );
  private Points points = new Points( );
  private int count = 1;
  
  Tooth ( ) { }
  
  Tooth ( Tooth t ) {
    for ( Point p : t.points ) {
      points.add( new Point( p.edge( ), p.count( ) ) );
    }
    for ( Edge e : t.crown ) {
      crown.add( e );
    }
    root.fst( t.root.fst() );
    root.snd( t.root.snd() );
    count = t.count;
  }
  
  //stand in to test
  boolean equals( Tooth t ) {
    return crown.equals( t.crown ) && root.equals( t.root );
  }
  
  void expandCrown( Edge e ) { crown.add( e ); }
  
  void forkRight( Edge e ) { root.fst( e ); }
  void forkLeft ( Edge e ) { root.snd( e ); }
  
  void addPoint( Edge e ) {
    if ( points.contains( e ) )
      points.get( points.indexOf( e ) ).incrementCount( );
    else points.add( new Point( e, 1 ) );
  }    
  
  final Line crown   ( ) { return crown; }
  final Fork root    ( )  { return root; }
  final Points points( ) { return points; }
  final int count    ( ) { return count; }
  
  void display( ) {
    //println( "Tooth:" );
    println( "  Points:" );
    println( "    " + points );
    println( "  Crown:" );
    println( "    " + crown );
    println( "  Root:" );
    println( "    " + root );
    println( "  Count:  " + count );
  }
}

//Sequentially equated
class Line extends ArrayList< Edge > {
  boolean equals( Line line ) {
    Iterator< Edge > itr_this = iterator( );
    Iterator< Edge > itr_line = line.iterator( );
    while ( itr_this.hasNext( ) && itr_line.hasNext( ) ) {
      if ( ! itr_this.next( ).equals( itr_line.next( ) ) ) return false;
    }
    return true;
  }
}

class Fork extends Pair< Edge, Edge > {
  //accounts for swapped order
  boolean equals( Fork f ) {
    if ( f.fst().equals( fst() ) ) return f.snd().equals( snd() );
    else if ( f.fst().equals( snd() ) ) return f.snd().equals( fst() );
    else return false;
  }
}

class Point extends Pair< Edge, Integer > {
  
  Point ( Edge e ) {
    super( );
    fst( e );
    snd( 1 );
  }
  
  Point ( Edge e, Integer i ) {
    super( );
    fst( e );
    snd( i );
  }
  
  /*
  boolean equals( Point p ) {
    return p.fst( ).equals( fst( ) );
  }
  */
  
  boolean equals( Edge e ) { return fst( ).equals( e ); }
  
  void incrementCount( ) { snd( snd( ) + 1 ); }
  
  String toString( ) {
    String s = "( " + fst( ).toString( ) + ", Count: " + snd( ).toString( ) + " )";
    return s;
  }
}

class Points extends ArrayList< Point > {
  boolean equals( Points ps ) {
    Iterator< Point > itr = iterator( );
    while ( itr.hasNext( ) ) {
      if ( !ps.contains( itr.next( ) ) ) return false;
    }
    return true;
  }
}



