class Turtle {
  PVector pos;
  PVector dir;
  float step; 
  
  Turtle(PVector _pos, PVector _dir, float len) {
    pos = _pos.copy();
    dir = _dir.copy();
    step = len;
  }
  
  String generate(String axiom, String[] prop) {
    String newStr = "";
    step /= 4;
    for (int i=0; i<axiom.length(); i++) {
      char c = axiom.charAt(i);
      if (c=='F') {
        newStr += prop[0];
      } else if (c=='f') {
        newStr += prop[1];
      } else {
        newStr += c;
      }
    }
    return newStr;
  }
  
  void moveQuadraticKoch(char c) {
    if (c=='F') {
      PVector newDir = dir.copy();
      newDir.mult(step);
      PVector newPos = PVector.add(pos, newDir);
      line(pos.x, pos.y, newPos.x, newPos.y);
      pos = newPos;
    } else if(c=='f') {
      PVector newDir = dir.copy();
      newDir.mult(step);
      PVector newPos = PVector.add(pos, newDir);
      pos = newPos;
    } else if(c=='+') {
      dir.rotate(-PI/2);
    } else if(c=='-') {
      dir.rotate(PI/2);
    }
  }
  void reset(PVector initPos, PVector initDir) {
    pos = initPos.copy();
    dir = initDir.copy();
  }
}
