DEVICE net_mux

LAYER FLOW

V BANK b1_1, b1_2, b1_3, b1_4, b1_5, b1_6, b1_7, b1_8 of  PORT portRadius=100  spacing=1500 ;
V BANK b2_1, b2_2, b2_3, b2_4, b2_5, b2_6, b2_7, b2_8 of  LONG CELL TRAP numberOfChambers=10 chamberWidth=100 chamberLength=100 chamberSpacing=30 feedingChannelWidth=100;
V TREE m1 8 to 1 spacing=500 flowChannelWidth=100 stageLength=500;
H MUX m2 1 to 2 sspacing=500 width=400 length=100 stageLength=1000 flowChannelWidth=100 controlChannelWidth=50;
H BANK b3_1, b3_2 of   PORT portRadius=100  spacing=1500 ;
PORT p1, p2 portRadius=100;
NODE n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
CHANNEL c1 from b1_1 to n1 channelWidth=100;
CHANNEL c2 from b1_2 to n2 channelWidth=100;
CHANNEL c3 from b1_3 to n3 channelWidth=100;
CHANNEL c4 from b1_4 to n4 channelWidth=100;
CHANNEL c5 from b1_5 to n5 channelWidth=100;
CHANNEL c6 from b1_6 to n6 channelWidth=100;
CHANNEL c7 from b1_7 to n7 channelWidth=100;
CHANNEL c8 from b1_8 to n8 channelWidth=100;
CHANNEL c9 from n1 to n2 channelWidth=100;
CHANNEL c10 from n2 to n3 channelWidth=100;
CHANNEL c11 from n3 to n4 channelWidth=100;
CHANNEL c12 from n4 to n5 channelWidth=100;
CHANNEL c13 from n5 to n6 channelWidth=100;
CHANNEL c14 from n6 to n7 channelWidth=100;
CHANNEL c15 from n7 to n8 channelWidth=100;
CHANNEL c16 from n1 to b2_1 channelWidth=100;
CHANNEL c17 from n2 to b2_2 channelWidth=100;
CHANNEL c18 from n3 to b2_3 channelWidth=100;
CHANNEL c19 from n4 to b2_4 channelWidth=100;
CHANNEL c20 from n5 to b2_5 channelWidth=100;
CHANNEL c21 from n6 to b2_6 channelWidth=100;
CHANNEL c22 from n7 to b2_7 channelWidth=100;
CHANNEL c23 from n8 to b2_8 channelWidth=100;
CHANNEL c24 from b2_1 to n9 channelWidth=100;
CHANNEL c25 from b2_2 to n10 channelWidth=100;
CHANNEL c26 from b2_3 to n11 channelWidth=100;
CHANNEL c27 from b2_4 to n12 channelWidth=100;
CHANNEL c28 from b2_5 to n13 channelWidth=100;
CHANNEL c29 from b2_6 to n14 channelWidth=100;
CHANNEL c30 from b2_7 to n15 channelWidth=100;
CHANNEL c31 from b2_8 to n16 channelWidth=100;
CHANNEL c32 from n9 to n10 channelWidth=100;
CHANNEL c33 from n10 to n11 channelWidth=100;
CHANNEL c34 from n11 to n12 channelWidth=100;
CHANNEL c35 from n12 to n13 channelWidth=100;
CHANNEL c36 from n13 to n14 channelWidth=100;
CHANNEL c37 from n14 to n15 channelWidth=100;
CHANNEL c38 from n15 to n16 channelWidth=100;
CHANNEL c39 from n16 to p1 channelWidth=100;
CHANNEL c40 from n9 to m1 1 channelWidth=100;
CHANNEL c41 from n10 to m1 2 channelWidth=100;
CHANNEL c42 from n11 to m1 3 channelWidth=100;
CHANNEL c43 from n12 to m1 4 channelWidth=100;
CHANNEL c44 from n13 to m1 5 channelWidth=100;
CHANNEL c45 from n14 to m1 6 channelWidth=100;
CHANNEL c46 from n15 to m1 7 channelWidth=100;
CHANNEL c47 from n16 to m1 8 channelWidth=100;
CHANNEL c48 from m1 9 to p2 channelWidth=100;
CHANNEL c49 from n1 to m2 1 channelWidth=100;
CHANNEL c50 from m2 2 to b3_1 channelWidth=100;
CHANNEL c51 from m2 3 to b3_2 channelWidth=100;

END LAYER

LAYER CONTROL

PORT cp1, cp2, cp3, cp4, cp5, cp6 portRadius=100;
CHANNEL cm1 from cp1 to m2 4 channelWidth=50;
CHANNEL cm2 from cp2 to m2 5 channelWidth=50;
VALVE v1 on c1 width=150 length=300;
VALVE v2 on c2 width=150 length=300;
VALVE v3 on c3 width=150 length=300;
VALVE v4 on c4 width=150 length=300;
VALVE v5 on c5 width=150 length=300;
VALVE v6 on c6 width=150 length=300;
VALVE v7 on c7 width=150 length=300;
VALVE v8 on c8 width=150 length=300;
CHANNEL cc1 from v1 to v2 channelWidth=50;
CHANNEL cc2 from v2 to v3 channelWidth=50;
CHANNEL cc3 from v3 to v4 channelWidth=50;
CHANNEL cc4 from v4 to v5 channelWidth=50;
CHANNEL cc5 from v5 to v6 channelWidth=50;
CHANNEL cc6 from v6 to v7 channelWidth=50;
CHANNEL cc7 from v7 to v8 channelWidth=50;
CHANNEL cc8 from v8 to cp3 channelWidth=50;
VALVE v9 on c49 width=300 length=150;
VALVE v10 on c9 width=300 length=150;
VALVE v11 on c10 width=300 length=150;
VALVE v12 on c11 width=300 length=150;
VALVE v13 on c12 width=300 length=150;
VALVE v14 on c13 width=300 length=150;
VALVE v15 on c14 width=300 length=150;
VALVE v16 on c15 width=300 length=150;
NET n1 from cp4 to v16, v10, v11, v12, v13, v14, v15, v9 channelWidth=50;
VALVE v17 on c32 width=300 length=150;
VALVE v18 on c33 width=300 length=150;
VALVE v19 on c34 width=300 length=150;
VALVE v20 on c35 width=300 length=150;
VALVE v21 on c36 width=300 length=150;
VALVE v22 on c37 width=300 length=150;
VALVE v23 on c38 width=300 length=150;
VALVE v24 on c39 width=300 length=150;
VALVE v25 on c40 width=150 length=300;
VALVE v26 on c41 width=150 length=300;
VALVE v27 on c42 width=150 length=300;
VALVE v28 on c43 width=150 length=300;
VALVE v29 on c44 width=150 length=300;
VALVE v30 on c45 width=150 length=300;
VALVE v31 on c46 width=150 length=300;
VALVE v32 on c47 width=150 length=300;
CHANNEL cc41 from v25 to v26 channelWidth=50;
CHANNEL cc42 from v26 to v27 channelWidth=50;
CHANNEL cc43 from v27 to v28 channelWidth=50;
CHANNEL cc44 from v28 to v29 channelWidth=50;
CHANNEL cc45 from v29 to v30 channelWidth=50;
CHANNEL cc46 from v30 to v31 channelWidth=50;
CHANNEL cc47 from v31 to v32 channelWidth=50;
CHANNEL cc48 from v25 to cp6 channelWidth=50;
NET n2 from cp5 to v24, v18, v19, v20, v21, v22, v23, v17 channelWidth=50;

END LAYER

