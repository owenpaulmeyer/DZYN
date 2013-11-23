class Ratio {
  private double num;
  private double den;
  
  Ratio ( double _num, double _den ) { num = _num; den = _den; }
  
  double numerator( ) { return num; }
  double denominator( ) { return den; }
  
  double eval( ) {
    return num / den;
  }
 
}
