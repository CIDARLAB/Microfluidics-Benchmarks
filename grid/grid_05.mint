DEVICE grid_5

LAYER FLOW
H TREE m1 1 to 5 spacing=1200 flowChannelWidth=100;
H TREE m2 5 to 1 spacing=1200 flowChannelWidth=100;
 PORT p1, p2 portRadius=100;
SQUARE CELL TRAP ct1, ct2, ct3, ct4, ct5, ct6, ct7, ct8, ct9, ct10, ct11, ct12, ct13, ct14, ct15, ct16, ct17, ct18, ct19, ct20, ct21, ct22, ct23, ct24, ct25 chamberWidth=100 chamberLength=100 channelWidth=100;
CHANNEL c1 from p1 to m1 1 channelWidth=100;
CHANNEL c2 from m1 2 to ct1 1 channelWidth=100;
CHANNEL c3 from m1 3 to ct2 1 channelWidth=100;
CHANNEL c4 from m1 4 to ct3 1 channelWidth=100;
CHANNEL c5 from m1 5 to ct4 1 channelWidth=100;
CHANNEL c6 from m1 6 to ct5 1 channelWidth=100;

CHANNEL c7 from ct1 2 to ct2 4 channelWidth=100;
CHANNEL c8 from ct2 2 to ct3 4 channelWidth=100;
CHANNEL c9 from ct3 2 to ct4 4 channelWidth=100;
CHANNEL c10 from ct4 2 to ct5 4 channelWidth=100;

CHANNEL c11 from ct1 3 to ct6 1 channelWidth=100;
CHANNEL c12 from ct2 3 to ct7 1 channelWidth=100;
CHANNEL c13 from ct3 3 to ct8 1 channelWidth=100;
CHANNEL c14 from ct4 3 to ct9 1 channelWidth=100;
CHANNEL c15 from ct5 3 to ct10 1 channelWidth=100;

CHANNEL c16 from ct6 2 to ct7 4 channelWidth=100;
CHANNEL c17 from ct7 2 to ct8 4 channelWidth=100;
CHANNEL c18 from ct8 2 to ct9 4 channelWidth=100;
CHANNEL c19 from ct9 2 to ct10 4 channelWidth=100;

CHANNEL c20 from ct6 3 to ct11 1 channelWidth=100;
CHANNEL c21 from ct7 3 to ct12 1 channelWidth=100;
CHANNEL c22 from ct8 3 to ct13 1 channelWidth=100;
CHANNEL c23 from ct9 3 to ct14 1 channelWidth=100;
CHANNEL c24 from ct10 3 to ct15 1 channelWidth=100;

CHANNEL c25 from ct11 2 to ct12 4 channelWidth=100;
CHANNEL c26 from ct12 2 to ct13 4 channelWidth=100;
CHANNEL c27 from ct13 2 to ct14 4 channelWidth=100;
CHANNEL c28 from ct14 2 to ct15 4 channelWidth=100;

CHANNEL c29 from ct11 3 to ct16 1 channelWidth=100;
CHANNEL c30 from ct12 3 to ct17 1 channelWidth=100;
CHANNEL c31 from ct13 3 to ct18 1 channelWidth=100;
CHANNEL c32 from ct14 3 to ct19 1 channelWidth=100;
CHANNEL c33 from ct15 3 to ct20 1 channelWidth=100;

CHANNEL c34 from ct16 2 to ct17 4 channelWidth=100;
CHANNEL c35 from ct17 2 to ct18 4 channelWidth=100;
CHANNEL c36 from ct18 2 to ct19 4 channelWidth=100;
CHANNEL c37 from ct19 2 to ct20 4 channelWidth=100;

CHANNEL c38 from ct16 3 to ct21 1 channelWidth=100;
CHANNEL c39 from ct17 3 to ct22 1 channelWidth=100;
CHANNEL c40 from ct18 3 to ct23 1 channelWidth=100;
CHANNEL c41 from ct19 3 to ct24 1 channelWidth=100;
CHANNEL c42 from ct20 3 to ct25 1 channelWidth=100;

CHANNEL c43 from ct21 2 to ct22 4 channelWidth=100;
CHANNEL c44 from ct22 2 to ct23 4 channelWidth=100;
CHANNEL c45 from ct23 2 to ct24 4 channelWidth=100;
CHANNEL c46 from ct24 2 to ct25 4 channelWidth=100;
CHANNEL c47 from ct21 3 to m2 1 channelWidth=100;
CHANNEL c48 from ct22 3 to m2 2 channelWidth=100;
CHANNEL c49 from ct23 3 to m2 3 channelWidth=100;
CHANNEL c50 from ct24 3 to m2 4 channelWidth=100;
CHANNEL c51 from ct25 3 to m2 5 channelWidth=100;
CHANNEL c52 from m2 6 to p1 channelWidth=100;

END LAYER

LAYER CONTROL
 V BANK cpb1 of 5  PORT portRadius=100  spacing=1500 ;
 V BANK cpb2 of 4  PORT portRadius=100  spacing=1500 ;

VALVE v1 on c7 w=100 l=300;
VALVE v2 on c8 w=100 l=300;
VALVE v3 on c9 w=100 l=300;
VALVE v4 on c10 w=100 l=300;

NET n1 from cpb1_1 to v1, v2, v3, v4 channelWidth=50;

VALVE v5 on c11 w=300 l=100;
VALVE v6 on c12 w=300 l=100;
VALVE v7 on c13 w=300 l=100;
VALVE v8 on c14 w=300 l=100;
VALVE v9 on c15 w=300 l=100;

CHANNEL cc1 from v5 to v6 channelWidth=50;
CHANNEL cc2 from v6 to v7 channelWidth=50;
CHANNEL cc3 from v7 to v8 channelWidth=50;
CHANNEL cc4 from v8 to v9 channelWidth=50;
CHANNEL cc5 from v9 to cpb2_1 channelWidth=50;

VALVE v10 on c16 w=100 l=300;
VALVE v11 on c17 w=100 l=300;
VALVE v12 on c18 w=100 l=300;
VALVE v13 on c19 w=100 l=300;

NET n2 from cpb1_2 to v10, v11, v12, v13 channelWidth=50;

VALVE v14 on c20 w=300 l=100;
VALVE v15 on c21 w=300 l=100;
VALVE v16 on c22 w=300 l=100;
VALVE v17 on c23 w=300 l=100;
VALVE v18 on c24 w=300 l=100;

CHANNEL cc6 from v14 to v15 channelWidth=50;
CHANNEL cc7 from v15 to v16 channelWidth=50;
CHANNEL cc8 from v16 to v17 channelWidth=50;
CHANNEL cc9 from v17 to v18 channelWidth=50;
CHANNEL cc10 from v18 to cpb2_2 channelWidth=50;

VALVE v19 on c25 w=100 l=300;
VALVE v20 on c26 w=100 l=300;
VALVE v21 on c27 w=100 l=300;
VALVE v22 on c28 w=100 l=300;

NET n3 from cpb1_3 to v19, v20, v21, v22 channelWidth=50;

VALVE v23 on c29 w=300 l=100;
VALVE v24 on c30 w=300 l=100;
VALVE v25 on c31 w=300 l=100;
VALVE v26 on c32 w=300 l=100;
VALVE v27 on c33 w=300 l=100;

CHANNEL cc11 from v23 to v24 channelWidth=50;
CHANNEL cc12 from v24 to v25 channelWidth=50;
CHANNEL cc13 from v25 to v26 channelWidth=50;
CHANNEL cc14 from v26 to v27 channelWidth=50;
CHANNEL cc15 from v27 to cpb2_3 channelWidth=50;

VALVE v28 on c34 w=100 l=300;
VALVE v29 on c35 w=100 l=300;
VALVE v30 on c36 w=100 l=300;
VALVE v31 on c37 w=100 l=300;

NET n4 from cpb1_4 to v28, v29, v30, v31 channelWidth=50;

VALVE v32 on c38 w=300 l=100;
VALVE v33 on c39 w=300 l=100;
VALVE v34 on c40 w=300 l=100;
VALVE v35 on c41 w=300 l=100;
VALVE v36 on c42 w=300 l=100;

CHANNEL cc16 from v32 to v33 channelWidth=50;
CHANNEL cc17 from v33 to v34 channelWidth=50;
CHANNEL cc18 from v34 to v35 channelWidth=50;
CHANNEL cc19 from v35 to v36 channelWidth=50;
CHANNEL cc20 from v36 to cpb2_4 channelWidth=50;

VALVE v37 on c43 w=100 l=300;
VALVE v38 on c44 w=100 l=300;
VALVE v39 on c45 w=100 l=300;
VALVE v40 on c46 w=100 l=300;

NET n5 from cpb1_5 to v37, v38, v39, v40 channelWidth=50;

END LAYER
