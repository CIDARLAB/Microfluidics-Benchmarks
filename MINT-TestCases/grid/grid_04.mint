DEVICE grid_4

LAYER FLOW
H TREE m1 1 to 4 spacing=1200 flowChannelWidth=100;
H TREE m2 4 to 1 spacing=1200 flowChannelWidth=100;
PORT p1, p2 portRadius=100;
SQUARE CELL TRAP ct1, ct2, ct3, ct4, ct5, ct6, ct7, ct8, ct9, ct10, ct11, ct12, ct13, ct14, ct15, ct16 chamberWidth=100 chamberLength=100 channelWidth=100;
CHANNEL c1 from p1 to m1 1 channelWidth=100;
CHANNEL c2 from m1 2 to ct1 1 channelWidth=100;
CHANNEL c3 from m1 3 to ct2 1 channelWidth=100;
CHANNEL c4 from m1 4 to ct3 1 channelWidth=100;
CHANNEL c5 from m1 5 to ct4 1 channelWidth=100;

CHANNEL c6 from ct1 2 to ct2 4 channelWidth=100;
CHANNEL c7 from ct2 2 to ct3 4 channelWidth=100;
CHANNEL c8 from ct3 2 to ct4 4 channelWidth=100;

CHANNEL c9 from ct1 3 to ct5 1 channelWidth=100;
CHANNEL c10 from ct2 3 to ct6 1 channelWidth=100;
CHANNEL c11 from ct3 3 to ct7 1 channelWidth=100;
CHANNEL c12 from ct4 3 to ct8 1 channelWidth=100;

CHANNEL c13 from ct5 2 to ct6 4 channelWidth=100;
CHANNEL c14 from ct6 2 to ct7 4 channelWidth=100;
CHANNEL c15 from ct7 2 to ct8 4 channelWidth=100;

CHANNEL c16 from ct5 3 to ct9 1 channelWidth=100;
CHANNEL c17 from ct6 3 to ct10 1 channelWidth=100;
CHANNEL c18 from ct7 3 to ct11 1 channelWidth=100;
CHANNEL c19 from ct8 3 to ct12 1 channelWidth=100;

CHANNEL c20 from ct9 2 to ct10 4 channelWidth=100;
CHANNEL c21 from ct10 2 to ct11 4 channelWidth=100;
CHANNEL c22 from ct11 2 to ct12 4 channelWidth=100;

CHANNEL c23 from ct9 3 to ct13 1 channelWidth=100;
CHANNEL c24 from ct10 3 to ct14 1 channelWidth=100;
CHANNEL c25 from ct11 3 to ct15 1 channelWidth=100;
CHANNEL c26 from ct12 3 to ct16 1 channelWidth=100;

CHANNEL c27 from ct13 2 to ct14 4 channelWidth=100;
CHANNEL c28 from ct14 2 to ct15 4 channelWidth=100;
CHANNEL c29 from ct15 2 to ct16 4 channelWidth=100;
CHANNEL c30 from ct13 3 to m2 1 channelWidth=100;
CHANNEL c31 from ct14 3 to m2 2 channelWidth=100;
CHANNEL c32 from ct15 3 to m2 3 channelWidth=100;
CHANNEL c33 from ct16 3 to m2 4 channelWidth=100;
CHANNEL c34 from m2 5 to p2 channelWidth=100;

END LAYER

LAYER CONTROL
V BANK cpb1 of 4  PORT portRadius=100  spacing=1500 ;
V BANK cpb2 of 3  PORT portRadius=100  spacing=1500 ;

VALVE v1 on c6 width=100 length=300;
VALVE v2 on c7 width=100 length=300;
VALVE v3 on c8 width=100 length=300;

NET n1 from cpb1_1 to v1, v2, v3 channelWidth=50;

VALVE v4 on c9 width=300 length=100;
VALVE v5 on c10 width=300 length=100;
VALVE v6 on c11 width=300 length=100;
VALVE v7 on c12 width=300 length=100;

CHANNEL cc1 from v4 to v5 channelWidth=50;
CHANNEL cc2 from v5 to v6 channelWidth=50;
CHANNEL cc3 from v6 to v7 channelWidth=50;
CHANNEL cc4 from v7 to cpb2_1 channelWidth=50;

VALVE v8 on c13 width=100 length=300;
VALVE v9 on c14 width=100 length=300;
VALVE v10 on c15 width=100 length=300;

NET n2 from cpb1_2 to v8, v9, v10 channelWidth=50;

VALVE v11 on c16 width=300 length=100;
VALVE v12 on c17 width=300 length=100;
VALVE v13 on c18 width=300 length=100;
VALVE v14 on c19 width=300 length=100;

CHANNEL cc5 from v11 to v12 channelWidth=50;
CHANNEL cc6 from v12 to v13 channelWidth=50;
CHANNEL cc7 from v13 to v14 channelWidth=50;
CHANNEL cc8 from v14 to cpb2_2 channelWidth=50;

VALVE v15 on c20 width=100 length=300;
VALVE v16 on c21 width=100 length=300;
VALVE v17 on c22 width=100 length=300;

NET n3 from cpb1_3 to v15, v16, v17 channelWidth=50;

VALVE v18 on c23 width=300 length=100;
VALVE v19 on c24 width=300 length=100;
VALVE v20 on c25 width=300 length=100;
VALVE v21 on c26 width=300 length=100;

CHANNEL cc9 from v18 to v19 channelWidth=50;
CHANNEL cc10 from v19 to v20 channelWidth=50;
CHANNEL cc11 from v20 to v21 channelWidth=50;
CHANNEL cc12 from v21 to cpb2_3 channelWidth=50;

VALVE v22 on c27 width=100 length=300;
VALVE v23 on c28 width=100 length=300;
VALVE v24 on c29 width=100 length=300;

NET n4 from cpb1_4 to v22, v23, v24 channelWidth=50;

END LAYER
