class Ratio {
  private double num;
  private double den;
  
  Ratio ( double _num, double _den ) { num = _num; den = _den; }
  
  final double numerator( ) { return num; }
  final double denominator( ) { return den; }
  
  double eval( ) {
    return num / den;
  }
 
}
