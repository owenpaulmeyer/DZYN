class Pair < T1, T2 > {
  private T1 fst;
  private T2 snd;
  
  Pair ( ) {}
  
  Pair ( T1 t1, T2 t2 ) { fst = t1; snd = t2; }
  
  void setfst ( T1 t1 ) { fst = t1; }
  
  void setsnd ( T2 t2 ) { snd = t2; }
  
  final T1 fst( ) { return fst; }
  
  final T2 snd( ) { return snd; }
  
  void fst( T1 o ) { fst = o; }
  
  void snd( T2 o ) { snd = o; }
  
  String toString( ) {
    String s = "( " + fst( ).toString( ) + ", " + snd( ).toString( ) + " )";
    return s;
  }

}
