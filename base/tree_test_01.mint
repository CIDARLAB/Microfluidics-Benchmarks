DEVICE tree_test_01

LAYER FLOW

PORT p0 r=100;
V BANK b0 of 8 PORT r=100 channelWidth=100;
V BANK b0 of 8 PORT r=100 channelWidth=100;

H IN TREE ct0 of 8 

V BANK lct of 8 LONG CELL TRAP numChambers=10 chamberLength=100 chamberWidth=100 chamberSpacing=30 flowChannelWidth=100 controlChannelWidth=20;

CHANNEL c0 from ct0 9 to p0 4;

CHANNEL c1 from ct0 1 to b0_1;
CHANNEL c2 from ct0 2 to b0_2;
CHANNEL c3 from ct0 3 to b0_3;
CHANNEL c4 from ct0 4 to b0_4;
CHANNEL c5 from ct0 5 to b0_5;
CHANNEL c6 from ct0 6 to b0_6;
CHANNEL c7 from ct0 7 to b0_7;
CHANNEL c8 from ct0 8 to b0_8;

CHANNEL c11 from lct_1 to b1_1;
CHANNEL c12 from lct_2 to b1_2;
CHANNEL c13 from lct_3 to b1_3;
CHANNEL c14 from lct_4 to b1_4;
CHANNEL c15 from lct_5 to b1_5;
CHANNEL c16 from lct_6 to b1_6;
CHANNEL c17 from lct_7 to b1_7;
CHANNEL c18 from lct_8 to b1_8;


END LAYER

LAYER CONTROL
END LAYER 
