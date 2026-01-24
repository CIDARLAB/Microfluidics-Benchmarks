DEVICE artificial_cells

LAYER FLOW

PORT p1, p2;

PORT p3, p4, p5, p6, p7, p8, p9, p10;

NOZZLE DROPLET GENERATOR dg1, dg2, dg3, dg4, dg5, dg6, dg7, dg8;

TREE t1 1 to 8;
TREE t2 1 to 16;

CHANNEL c1 from p1 1 to t1 1;
CHANNEL c2 from p2 1 to t2 2;

CHANNEL c3 from t1 2 to dg1 4;
CHANNEL c4 from t1 3 to dg2 4;
CHANNEL c5 from t1 4 to dg3 4;
CHANNEL c6 from t1 5 to dg4 4;
CHANNEL c7 from t1 6 to dg6 4;
CHANNEL c8 from t1 7 to dg6 4;
CHANNEL c9 from t1 8 to dg7 4;
CHANNEL c10 from t1 9 to dg8 4;

CHANNEL c11 from t2 2 to dg1 1;
CHANNEL c12 from t2 3 to dg1 3;
CHANNEL c13 from t2 4 to dg2 1;
CHANNEL c14 from t2 5 to dg2 3;
CHANNEL c15 from t2 6 to dg3 1;
CHANNEL c16 from t2 7 to dg3 3;
CHANNEL c17 from t2 8 to dg4 1;
CHANNEL c18 from t2 9 to dg4 3;
CHANNEL c19 from t2 10 to dg5 1;
CHANNEL c20 from t2 11 to dg5 3;
CHANNEL c21 from t2 12 to dg6 1;
CHANNEL c22 from t2 13 to dg6 3;
CHANNEL c23 from t2 14 to dg7 1;
CHANNEL c24 from t2 15 to dg7 3;
CHANNEL c25 from t2 16 to dg8 1;
CHANNEL c26 from t2 17 to dg8 3;

CHANNEL c27 from dg1 2 to p3 1;
CHANNEL c28 from dg2 2 to p4 1;
CHANNEL c29 from dg3 2 to p5 1;
CHANNEL c30 from dg4 2 to p5 1;
CHANNEL c31 from dg5 2 to p6 1;
CHANNEL c32 from dg6 2 to p7 1;
CHANNEL c33 from dg7 2 to p8 1;
CHANNEL c34 from dg8 2 to p9 1;

END LAYER
