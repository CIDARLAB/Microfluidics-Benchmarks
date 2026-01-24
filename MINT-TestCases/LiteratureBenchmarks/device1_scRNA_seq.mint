DEVICE scRNA_seq

LAYER FLOW

PORT p1, p2, p3;

PORT p4, p5;

MICROARRAY ma1 height = 10000 width = 10000;
MICROARRAY ma2, ma3, ma4;

CONNECTION c1 from p1 1 to ma1 1;
CONNECTION c2 from p1 1 to ma2 1;

CONNECTION c3 from p2 1 to ma3 1;
CONNECTION c4 from p3 1 to ma4 1;

NODE n1;
CONNECTION c5 from ma3 2 to n1 1;
CONNECTION c6 from ma4 2 to n1 1;

MIXER m1;
CONNECTION c7 from n1 1 to m1 1;

NOZZLE DROPLET GENERATOR dg;
CONNECTION c8 from ma1 2 to dg 1;
CONNECTION c9 from ma2 2 to dg 3;
CONNECTION c10 from m1 2 to dg 2;

DIAMOND REACTION CHAMBER drc;
CONNECTION c11 from dg 4 to drc 2;
CONNECTION c12 from drc 1 to p5 1; 
CONNECTION c14 from drc 3 to p5 1; 
CONNECTION c15 from drc 4 to p4 1; 

END LAYER
