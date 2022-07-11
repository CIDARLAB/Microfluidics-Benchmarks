DEVICE tree_constriant

LAYER FLOW

PORT p1 ;

BANK b1, b2, b3, b4 of PORT;

TREE t1 1 to 4 ;

CHANNEL c1 from p1 to t1;
CHANNEL c2 from t1 to b1;
CHANNEL c3 from t1 to b2;
CHANNEL c4 from t1 to b3;
CHANNEL c5 from t1 to b4;

END LAYER