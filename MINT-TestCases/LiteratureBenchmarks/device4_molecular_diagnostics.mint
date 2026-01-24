DEVICE bacteria_diagnostics_ref

LAYER FLOW

PORT p1, p2, p3, p4, p5;

MIXER m1 numberOfBends=3;
MIP BIOSENSOR bs1, bs2;

NODE n1, n2;

CONNECTION c1 from p1 to m1 1;
CONNECTION c2 from m1 2 to n1;
CONNECTION c3 from p2 to n2;
CONNECTION c4 from n1 to n2;
CONNECTION c5 from n1 to bs1 1;
CONNECTION c6 from n2 to bs2 1;

NODE n3;

CONNECTION c7 from bs1 2 to p3;
CONNECTION c8 from bs2 2 to n3;
CONNECTION c9 from n3 to p4;
CONNECTION c10 from n3 to p5;

END LAYER
