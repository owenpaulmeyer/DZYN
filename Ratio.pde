class Ratio {
  private double num;
  private double den;
  
  Ratio ( double _num, double _den ) { num = _num; den = _den; }
  
  final double numerator( ) { return num; }
  final double denominator( ) { return den; }
  
  void balance( Ratio r ) {
    num += r.numerator( );
    den += r.denominator( );
  }

  double eval( ) {
    return num / den;
  }
 
}
