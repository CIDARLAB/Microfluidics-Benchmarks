DEVICE nonplanar

LAYER FLOW

PORT p1, p2, p3, p4 r=400;

CHANNEL c1 from p1 to p2 w=100;
CHANNEL c2 from p2 to p3 w=100;
CHANNEL c3 from p3 to p4 w=100;
CHANNEL c4 from p4 to p1 w=100;
CHANNEL c5 from p1 to p3 w=100;
CHANNEL c6 from p2 to p4 w=100;

END LAYER