
class Tooth {
  private Line crown = new Line( );
  private Fork root = new Fork( );
  private Points points = new Points( );
  private int count = 1;
  
  Tooth ( ) { }
  
  Tooth ( Tooth t ) {

    for ( Edge e : t.crown ) {
      crown.add( e );
    }
    root.fst( t.root.fst() );
    root.snd( t.root.snd() );
    count = t.count;
  }

  //stand in to test
  public boolean equals( Object obj ){
    if ( obj == this ) return true;    
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;    
    Tooth t = ( Tooth ) obj;
    return crown.equals( t.crown ) && root.equals( t.root );
  }
  
  void expandCrown( Edge e ) { crown.add( e ); }
  
  void forkRight( Edge e ) { root.fst( e ); }
  void forkLeft ( Edge e ) { root.snd( e ); }
  
  void addPoint( Edge e ) {
    Point p = new Point( e, 1 );
    if ( points.contains( p ) ) {
      points.get( points.indexOf( p ) ).incrementCount( );
    }
    else points.add( new Point( e, 1 ) );
  }
  
  void addPoint( Point p ) {
    if ( points.contains( p ) ) {
      points.get( points.indexOf( p ) ).incrementCount( );
    }
    else points.add( p );
  }
  
  void addPoints( Points ps ) {
    for ( Point p : ps ) addPoint( p );
  }
  
  void incrementCount( ) { ++count; }
  
  final Line crown   ( ) { return crown; }
  final Fork root    ( ) { return root; }
  final Points points( ) { return points; }
  final int count    ( ) { return count; }
  
  
  JSONObject toJSON( ) {
    JSONObject jsn = new JSONObject( );
    jsn.setJSONObject( "points", points.toJSON( ) );
    jsn.setJSONObject( "crown", crown.toJSON( ) );
    jsn.setJSONObject( "root", root.toJSON( ) );
    jsn.setInt( "count", count );
    return jsn;
 }
  
  String toString( ) {
    String s = "\n  Points: "+points+"\n  Crown:  "+
      crown+"\n  Root:   "+root+"\n  Count:  "+count+"\n";
    return s;
  }
  
  //superflous
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
  
  public boolean equals( Object obj ){
    if ( obj == this ) return true;    
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;    
    Line line = ( Line ) obj;    
    Iterator< Edge > itr_this = iterator( );
    Iterator< Edge > itr_line = line.iterator( );
    if ( size( ) != line.size( ) ) return false;
    while ( itr_this.hasNext( ) && itr_line.hasNext( ) ) {
      if ( ! itr_this.next( ).equals( itr_line.next( ) ) ) return false;
    }
    return true;
  }
  
  JSONObject toJSON( ) {
    JSONObject jsn = new JSONObject( );
    JSONArray line = new JSONArray( );
    for ( int i = 0; i < this.size( ); ++i ) {
      JSONObject edge = this.get( i ).toJSON( );
      line.setJSONObject( i, edge );
    }
    jsn.setJSONArray( "line", line );
    return jsn;
 }
}

class Fork extends Pair< Edge, Edge > {
  
  //accounts for swapped order
  public boolean equals( Object obj ){
    if ( obj == this ) return true;    
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;    
    Fork f = ( Fork ) obj;    
    if ( f.fst().equals( fst() ) ) return f.snd().equals( snd() );    
    else if ( f.fst().equals( snd() ) ) return f.snd().equals( fst() );    
    else return false;
  }
  
  JSONObject toJSON( ) {
    JSONObject jsn = new JSONObject( );
    jsn.setJSONObject( "right", fst( ).toJSON( ) );
    jsn.setJSONObject( "left", snd( ).toJSON( ) );
    return jsn;
 }
}

class Point extends Pair< Edge, Integer >{
  
  Point ( Edge e ) {
    fst( e );
    snd( 1 );
  }
  
  Point ( Edge e, Integer i ) {
    fst( e );
    snd( i );
  }
  
  final Edge edge ( ) { return fst( ); }
  final int  count( ) { return snd( ); }
  
  public boolean equals( Object obj ){
    if ( obj == this ) return true;
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;
    Point p = ( Point ) obj;
    return p.edge( ).equals( edge( ) );
  }

  void incrementCount( ) { snd( count( ) + 1 ); }
  
  JSONObject toJSON( ) {
    JSONObject jsn = new JSONObject( );
    jsn.setJSONObject( "point", fst( ).toJSON( ) );
    jsn.setInt( "count", snd( ) );
    return jsn;
 }
  
  String toString( ) {
    String s = "( " + edge( ).toString( ) + ", Count: " + count( ) + " )";
    return s;
  }
}

class Points extends ArrayList< Point > {
  
  public boolean equals( Object obj ){
    if ( obj == this ) return true;
    if ( obj == null || obj.getClass( ) != getClass( ) ) return false;
    Points ps = ( Points ) obj;
    Iterator< Point > itr = iterator( );
    while ( itr.hasNext( ) ) {
      if ( !ps.contains( itr.next( ) ) ) return false;
    }
    return true;
  }
  
  JSONObject toJSON( ) {
    JSONObject jsn = new JSONObject( );
    JSONArray points = new JSONArray( );
    for ( int i = 0; i < this.size( ); ++i ) {
      JSONObject point = this.get( i ).toJSON( );
      points.setJSONObject( i, point );
    }
    jsn.setJSONArray( "points", points );
    return jsn;
 }
  
}



