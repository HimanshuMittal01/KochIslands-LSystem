String axiom1 = "F-F-F-F";
String[] prop1 = {"F-F+F+FF-F-F+F", "f"};
String axiom2 = "F-F-F-F";
String[] prop2 = {"F+FF-FF-F-F+F+FF-F-F+F+FF+FF-F", "f"};
String axiom3 = "-F";
String[] prop3 = {"F+F-F-F+F", "f"};
String axiom4 = "F+F+F+F";
String[] prop4 = {"F+f-FF+F+FF+Ff+FF-f+FF-F-FF-Ff-FFF", "ffffff"};
String axiom5 = "F-F-F-F";
String[] prop5 = {"FF-F-F-F-F-F+F", "f"};
String axiom6 = "F-F-F-F";
String[] prop6 = {"FF-F-F-F-FF", "f"};
String axiom7 = "F-F-F-F";
String[] prop7 = {"FF-F+F-F-FF", "f"};
String axiom8 = "F-F-F-F";
String[] prop8 = {"FF-F--F-F", "f"};
String axiom9 = "F-F-F-F";
String[] prop9 = {"F-FF--F-F", "f"};
String axiom10 = "F-F-F-F";
String[] prop10 = {"F-F+F-F-F", "f"};

String[] axioms = {axiom1, axiom2, axiom3, axiom4, axiom5, axiom6, axiom7, axiom8, axiom9, axiom10};
String[][] props = {prop1, prop2, prop3, prop4, prop5, prop6, prop7, prop8, prop9, prop10};
int current = 0;

PVector initPos;
PVector initDir;
float len;
Turtle turtle;

float sval = 1;
int xOff = 0, yOff = 0;

void setup() {
  size(1600, 800);
  len = 200;
  initPos = new PVector(width/2 - len/2, height/2 + len/2);
  initDir = new PVector(0, -1);
  turtle = new Turtle(initPos, initDir, len);
  
}
void draw() {
  background(0);
  scale(sval);
  translate(xOff, yOff);
  stroke(255);
  for (int i=0; i<axioms[current].length(); i++) {
    turtle.moveQuadraticKoch(axioms[current].charAt(i));
  }
  turtle.reset(initPos, initDir);
  
  constrain(sval, 0.5, 2.0);
}
void keyPressed() {
  if (key=='z' || key=='Z') {
    sval += 0.05;
  } else if (key=='x' || key=='X') {
    sval -= 0.05;
  }
  if (key=='w' || key=='W') {
    yOff += 5;
  }
  if (key=='a' || key=='A') {
    xOff += 5;
  }
  if (key=='s' || key=='S') {
    yOff += -5;
  }
  if (key=='d' || key=='D') {
    xOff += -5;
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    axioms[current] = turtle.generate(axioms[current], props[current]);
  } else {
    current = (current+1)%axioms.length;
    reset();
  }
}
void reset() {
  xOff = 0;
  yOff = 0;
  sval = 1;
  turtle = new Turtle(initPos, initDir, len);
}
