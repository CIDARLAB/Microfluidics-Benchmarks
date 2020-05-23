DEVICE grid_3

LAYER FLOW
H TREE m1 1 to 3 spacing=1200 flowChannelWidth=100;
H TREE m2 3 to 1 spacing=1200 flowChannelWidth=100;
 PORT p1, p2 portRadius=100;
SQUARE CELL TRAP ct1, ct2, ct3, ct4, ct5, ct6, ct7, ct8, ct9 chamberWidth=100 chamberLength=100 channelWidth=100 ;
CHANNEL c1 from p1 3 to m1 1 channelWidth=100;
CHANNEL c2 from m1 2 to ct1 1 channelWidth=100;
CHANNEL c3 from m1 3 to ct2 1 channelWidth=100;
CHANNEL c4 from m1 4 to ct3 1 channelWidth=100;

CHANNEL c5 from ct1 2 to ct2 4 channelWidth=100;
CHANNEL c6 from ct2 2 to ct3 4 channelWidth=100;

CHANNEL c7 from ct1 3 to ct4 1 channelWidth=100;
CHANNEL c8 from ct2 3 to ct5 1 channelWidth=100;
CHANNEL c9 from ct3 3 to ct6 1 channelWidth=100;

CHANNEL c10 from ct4 2 to ct5 4 channelWidth=100;
CHANNEL c11 from ct5 2 to ct6 4 channelWidth=100;

CHANNEL c12 from ct4 3 to ct7 1 channelWidth=100;
CHANNEL c13 from ct5 3 to ct8 1 channelWidth=100;
CHANNEL c14 from ct6 3 to ct9 1 channelWidth=100;

CHANNEL c15 from ct7 2 to ct8 4 channelWidth=100;
CHANNEL c16 from ct8 2 to ct9 4 channelWidth=100;
CHANNEL c17 from ct7 3 to m2 1 channelWidth=100;
CHANNEL c18 from ct8 3 to m2 2 channelWidth=100;
CHANNEL c19 from ct9 3 to m2 3 channelWidth=100;
CHANNEL c20 from m2 4 to p2 1 channelWidth=100;

END LAYER

LAYER CONTROL
 V BANK cpb1 of 3  PORT portRadius=100  spacing=1500 ;
 V BANK cpb2 of 2  PORT portRadius=100  spacing=1500 ;

VALVE v1 on c5 w=100 l=300;
VALVE v2 on c6 w=100 l=300;

NET n1 from cpb1 1 to v1 3, v2 3 channelWidth=50;

VALVE v3 on c7 w=300 l=100;
VALVE v4 on c8 w=300 l=100;
VALVE v5 on c9 w=300 l=100;

CHANNEL cc1 from v3 2 to v4 4 channelWidth=50;
CHANNEL cc2 from v4 2 to v5 4 channelWidth=50;
CHANNEL cc3 from v5 2 to cpb2 1 channelWidth=50;

VALVE v6 on c10 w=100 l=300;
VALVE v7 on c11 w=100 l=300;

NET n2 from cpb1 2 to v6 3, v7 3 channelWidth=50;

VALVE v8 on c12 w=300 l=100;
VALVE v9 on c13 w=300 l=100;
VALVE v10 on c14 w=300 l=100;

CHANNEL cc4 from v8 2 to v9 4 channelWidth=50;
CHANNEL cc5 from v9 2 to v10 4 channelWidth=50;
CHANNEL cc6 from v10 2 to cpb2 2 channelWidth=50;

VALVE v11 on c15 w=100 l=300;
VALVE v12 on c16 w=100 l=300;

NET n3 from cpb1 3 to v11 3, v12 3 channelWidth=50;

END LAYER
