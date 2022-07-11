DEVICE grid_6

LAYER FLOW
H TREE m1 1 to 6 spacing=1200 flowChannelWidth=100;
H TREE m2 1 to 6  spacing=1200 flowChannelWidth=100;
 PORT p1, p2 portRadius=100;
SQUARE CELL TRAP ct1, ct2, ct3, ct4, ct5, ct6, ct7, ct8, ct9, ct10, ct11, ct12, ct13, ct14, ct15, ct16, ct17, ct18, ct19, ct20, ct21, ct22, ct23, ct24, ct25, ct26, ct27, ct28, ct29, ct30, ct31, ct32, ct33, ct34, ct35, ct36 chamberWidth=100 chamberLength=100 channelWidth=100;
CHANNEL c1 from p1 to m1 1 channelWidth=100;
CHANNEL c2 from m1 2 to ct1 1 channelWidth=100;
CHANNEL c3 from m1 3 to ct2 1 channelWidth=100;
CHANNEL c4 from m1 4 to ct3 1 channelWidth=100;
CHANNEL c5 from m1 5 to ct4 1 channelWidth=100;
CHANNEL c6 from m1 6 to ct5 1 channelWidth=100;
CHANNEL c7 from m1 7 to ct6 1 channelWidth=100;

CHANNEL c8 from ct1 2 to ct2 4 channelWidth=100;
CHANNEL c9 from ct2 2 to ct3 4 channelWidth=100;
CHANNEL c10 from ct3 2 to ct4 4 channelWidth=100;
CHANNEL c11 from ct4 2 to ct5 4 channelWidth=100;
CHANNEL c12 from ct5 2 to ct6 4 channelWidth=100;

CHANNEL c13 from ct1 3 to ct7 1 channelWidth=100;
CHANNEL c14 from ct2 3 to ct8 1 channelWidth=100;
CHANNEL c15 from ct3 3 to ct9 1 channelWidth=100;
CHANNEL c16 from ct4 3 to ct10 1 channelWidth=100;
CHANNEL c17 from ct5 3 to ct11 1 channelWidth=100;
CHANNEL c18 from ct6 3 to ct12 1 channelWidth=100;

CHANNEL c19 from ct7 2 to ct8 4 channelWidth=100;
CHANNEL c20 from ct8 2 to ct9 4 channelWidth=100;
CHANNEL c21 from ct9 2 to ct10 4 channelWidth=100;
CHANNEL c22 from ct10 2 to ct11 4 channelWidth=100;
CHANNEL c23 from ct11 2 to ct12 4 channelWidth=100;

CHANNEL c24 from ct7 3 to ct13 1 channelWidth=100;
CHANNEL c25 from ct8 3 to ct14 1 channelWidth=100;
CHANNEL c26 from ct9 3 to ct15 1 channelWidth=100;
CHANNEL c27 from ct10 3 to ct16 1 channelWidth=100;
CHANNEL c28 from ct11 3 to ct17 1 channelWidth=100;
CHANNEL c29 from ct12 3 to ct18 1 channelWidth=100;

CHANNEL c30 from ct13 2 to ct14 4 channelWidth=100;
CHANNEL c31 from ct14 2 to ct15 4 channelWidth=100;
CHANNEL c32 from ct15 2 to ct16 4 channelWidth=100;
CHANNEL c33 from ct16 2 to ct17 4 channelWidth=100;
CHANNEL c34 from ct17 2 to ct18 4 channelWidth=100;

CHANNEL c35 from ct13 3 to ct19 1 channelWidth=100;
CHANNEL c36 from ct14 3 to ct20 1 channelWidth=100;
CHANNEL c37 from ct15 3 to ct21 1 channelWidth=100;
CHANNEL c38 from ct16 3 to ct22 1 channelWidth=100;
CHANNEL c39 from ct17 3 to ct23 1 channelWidth=100;
CHANNEL c40 from ct18 3 to ct24 1 channelWidth=100;

CHANNEL c41 from ct19 2 to ct20 4 channelWidth=100;
CHANNEL c42 from ct20 2 to ct21 4 channelWidth=100;
CHANNEL c43 from ct21 2 to ct22 4 channelWidth=100;
CHANNEL c44 from ct22 2 to ct23 4 channelWidth=100;
CHANNEL c45 from ct23 2 to ct24 4 channelWidth=100;

CHANNEL c46 from ct19 3 to ct25 1 channelWidth=100;
CHANNEL c47 from ct20 3 to ct26 1 channelWidth=100;
CHANNEL c48 from ct21 3 to ct27 1 channelWidth=100;
CHANNEL c49 from ct22 3 to ct28 1 channelWidth=100;
CHANNEL c50 from ct23 3 to ct29 1 channelWidth=100;
CHANNEL c51 from ct24 3 to ct30 1 channelWidth=100;

CHANNEL c52 from ct25 2 to ct26 4 channelWidth=100;
CHANNEL c53 from ct26 2 to ct27 4 channelWidth=100;
CHANNEL c54 from ct27 2 to ct28 4 channelWidth=100;
CHANNEL c55 from ct28 2 to ct29 4 channelWidth=100;
CHANNEL c56 from ct29 2 to ct30 4 channelWidth=100;

CHANNEL c57 from ct25 3 to ct31 1 channelWidth=100;
CHANNEL c58 from ct26 3 to ct32 1 channelWidth=100;
CHANNEL c59 from ct27 3 to ct33 1 channelWidth=100;
CHANNEL c60 from ct28 3 to ct34 1 channelWidth=100;
CHANNEL c61 from ct29 3 to ct35 1 channelWidth=100;
CHANNEL c62 from ct30 3 to ct36 1 channelWidth=100;

CHANNEL c63 from ct31 2 to ct32 4 channelWidth=100;
CHANNEL c64 from ct32 2 to ct33 4 channelWidth=100;
CHANNEL c65 from ct33 2 to ct34 4 channelWidth=100;
CHANNEL c66 from ct34 2 to ct35 4 channelWidth=100;
CHANNEL c67 from ct35 2 to ct36 4 channelWidth=100;
CHANNEL c68 from ct31 3 to m2 1 channelWidth=100;
CHANNEL c69 from ct32 3 to m2 2 channelWidth=100;
CHANNEL c70 from ct33 3 to m2 3 channelWidth=100;
CHANNEL c71 from ct34 3 to m2 4 channelWidth=100;
CHANNEL c72 from ct35 3 to m2 5 channelWidth=100;
CHANNEL c73 from ct36 3 to m2 6 channelWidth=100;
CHANNEL c74 from m2 7 to p2 channelWidth=100;

END LAYER

LAYER CONTROL
 V BANK cpb1 of 6  PORT portRadius=100  spacing=1500 ;
 V BANK cpb2 of 5  PORT portRadius=100  spacing=1500 ;

VALVE v1 on c8 width=100 length=300;
VALVE v2 on c9 width=100 length=300;
VALVE v3 on c10 width=100 length=300;
VALVE v4 on c11 width=100 length=300;
VALVE v5 on c12 width=100 length=300;

NET n1 from cpb1_1 to v1, v2, v3, v4, v5 channelWidth=50;

VALVE v6 on c13 width=300 length=100;
VALVE v7 on c14 width=300 length=100;
VALVE v8 on c15 width=300 length=100;
VALVE v9 on c16 width=300 length=100;
VALVE v10 on c17 width=300 length=100;
VALVE v11 on c18 width=300 length=100;

CHANNEL cc1 from v6 to v7 channelWidth=50;
CHANNEL cc2 from v7 to v8 channelWidth=50;
CHANNEL cc3 from v8 to v9 channelWidth=50;
CHANNEL cc4 from v9 to v10 channelWidth=50;
CHANNEL cc5 from v10 to v11 channelWidth=50;
CHANNEL cc6 from v11 to cpb2_1 channelWidth=50;

VALVE v12 on c19 width=100 length=300;
VALVE v13 on c20 width=100 length=300;
VALVE v14 on c21 width=100 length=300;
VALVE v15 on c22 width=100 length=300;
VALVE v16 on c23 width=100 length=300;

NET n2 from cpb1_2 to v12, v13, v14, v15, v16 channelWidth=50;

VALVE v17 on c24 width=300 length=100;
VALVE v18 on c25 width=300 length=100;
VALVE v19 on c26 width=300 length=100;
VALVE v20 on c27 width=300 length=100;
VALVE v21 on c28 width=300 length=100;
VALVE v22 on c29 width=300 length=100;

CHANNEL cc7 from v17 to v18 channelWidth=50;
CHANNEL cc8 from v18 to v19 channelWidth=50;
CHANNEL cc9 from v19 to v20 channelWidth=50;
CHANNEL cc10 from v20 to v21 channelWidth=50;
CHANNEL cc11 from v21 to v22 channelWidth=50;
CHANNEL cc12 from v22 to cpb2_2 channelWidth=50;

VALVE v23 on c30 width=100 length=300;
VALVE v24 on c31 width=100 length=300;
VALVE v25 on c32 width=100 length=300;
VALVE v26 on c33 width=100 length=300;
VALVE v27 on c34 width=100 length=300;

NET n3 from cpb1_3 to v23, v24, v25, v26, v27 channelWidth=50;

VALVE v28 on c35 width=300 length=100;
VALVE v29 on c36 width=300 length=100;
VALVE v30 on c37 width=300 length=100;
VALVE v31 on c38 width=300 length=100;
VALVE v32 on c39 width=300 length=100;
VALVE v33 on c40 width=300 length=100;

CHANNEL cc13 from v28 to v29 channelWidth=50;
CHANNEL cc14 from v29 to v30 channelWidth=50;
CHANNEL cc15 from v30 to v31 channelWidth=50;
CHANNEL cc16 from v31 to v32 channelWidth=50;
CHANNEL cc17 from v32 to v33 channelWidth=50;
CHANNEL cc18 from v33 to cpb2_3 channelWidth=50;

VALVE v34 on c41 width=100 length=300;
VALVE v35 on c42 width=100 length=300;
VALVE v36 on c43 width=100 length=300;
VALVE v37 on c44 width=100 length=300;
VALVE v38 on c45 width=100 length=300;

NET n4 from cpb1_4 to v34, v35, v36, v37, v38 channelWidth=50;

VALVE v39 on c46 width=300 length=100;
VALVE v40 on c47 width=300 length=100;
VALVE v41 on c48 width=300 length=100;
VALVE v42 on c49 width=300 length=100;
VALVE v43 on c50 width=300 length=100;
VALVE v44 on c51 width=300 length=100;

CHANNEL cc19 from v39 to v40 channelWidth=50;
CHANNEL cc20 from v40 to v41 channelWidth=50;
CHANNEL cc21 from v41 to v42 channelWidth=50;
CHANNEL cc22 from v42 to v43 channelWidth=50;
CHANNEL cc23 from v43 to v44 channelWidth=50;
CHANNEL cc24 from v44 to cpb2_4 channelWidth=50;

VALVE v45 on c52 width=100 length=300;
VALVE v46 on c53 width=100 length=300;
VALVE v47 on c54 width=100 length=300;
VALVE v48 on c55 width=100 length=300;
VALVE v49 on c56 width=100 length=300;

NET n5 from cpb1_5 to v45, v46, v47, v48, v49 channelWidth=50;

VALVE v50 on c57 width=300 length=100;
VALVE v51 on c58 width=300 length=100;
VALVE v52 on c59 width=300 length=100;
VALVE v53 on c60 width=300 length=100;
VALVE v54 on c61 width=300 length=100;
VALVE v55 on c62 width=300 length=100;

CHANNEL cc25 from v50 to v51 channelWidth=50;
CHANNEL cc26 from v51 to v52 channelWidth=50;
CHANNEL cc27 from v52 to v53 channelWidth=50;
CHANNEL cc28 from v53 to v54 channelWidth=50;
CHANNEL cc29 from v54 to v55 channelWidth=50;
CHANNEL cc30 from v55 to cpb2_5 channelWidth=50;

VALVE v56 on c63 width=100 length=300;
VALVE v57 on c64 width=100 length=300;
VALVE v58 on c65 width=100 length=300;
VALVE v59 on c66 width=100 length=300;
VALVE v60 on c67 width=100 length=300;

NET n6 from cpb1_6 to v56, v57, v58, v59, v60 channelWidth=50;

END LAYER
