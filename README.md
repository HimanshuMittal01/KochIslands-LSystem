# KochIslands-LSystem
This processing program creates beautiful quadratic koch islands using L-systems (edge-rewriting and node-rewriting) .

This example consists of 10 examples but there is no reason why you cannot add hundreds of them.

"quadratic koch island" file contains all the axioms and propagations and aslo the execution command.

"turtle" file contains how the prop commands will read out to the display.

Axioms are in the String format:

For example - String axiom1 = "F-F-F-F";

Propagation are in the String[] format:

Prop consists of two values.
'F' propagator and 'f' propagator.

For example - String[] prop1 = {"F-F+F+FF-F-F+F", "f"};

You can write your own axioms and propagations and then add it to the String[] axioms and String[][] props respectively. Then see the magic by changing "current" value and enjoy generations of your L-system.
