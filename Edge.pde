//Directional Edge
class Edge {
  
  private int x;
  private int y;
  
  
  
  Edge (int _x, int _y){
    x = _x;
    y = _y;
  }
  

  
  final int x(){return x;}
  final int y(){return y;}
  
  Edge inverse() {
    return new Edge( x * -1, y * -1 );
  }
  
  boolean equals(Edge e){
    return this.x == e.x() && this.y == e.y();
  }  
  boolean isNorth(){
    return (x==0 && y==-1);
  }
  boolean isSouth(){
    return (x==0 && y==1);
  }
  boolean isWest(){
    return (x==-1 && y==0);
  }
  boolean isEast(){
    return (x==1 && y==0);
  }
  boolean isNorthW(){
    return (x==-1 && y==-1);
  }
  boolean isNorthE(){
    return (x==1 && y==-1);
  }
  boolean isSouthW(){
    return (x==-1 && y==1);
  }
  boolean isSouthE(){
    return (x==1 && y==1);
  }
  
  String toString() {
    if( isNorth() ) return "North";
    else if( isSouth() ) return "South";
    else if( isWest() ) return "West";
    else if( isEast() ) return "East";
    else if( isNorthW() ) return "NorthW";
    else if( isNorthE() ) return "NorthE";
    else if( isSouthW() ) return "SouthW";
    else if( isSouthE() ) return "SouthE";
    else return "zero";
  }
}

boolean isNull( Object a ) {
  return (a == null);
}



