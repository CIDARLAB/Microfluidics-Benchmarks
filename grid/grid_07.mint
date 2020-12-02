DEVICE grid_7

LAYER FLOW
H TREE m1 1 to 7 spacing=1200 flowChannelWidth=100;
H TREE m2 7 to 1 spacing=1200 flowChannelWidth=100;
 PORT p1, p2 portRadius=100;
SQUARE CELL TRAP ct1, ct2, ct3, ct4, ct5, ct6, ct7, ct8, ct9, ct10, ct11, ct12, ct13, ct14, ct15, ct16, ct17, ct18, ct19, ct20, ct21, ct22, ct23, ct24, ct25, ct26, ct27, ct28, ct29, ct30, ct31, ct32, ct33, ct34, ct35, ct36, ct37, ct38, ct39, ct40, ct41, ct42, ct43, ct44, ct45, ct46, ct47, ct48, ct49 chamberWidth=100 chamberLength=100 channelWidth=100;
CHANNEL c1 from p1 3 to m1 1 channelWidth=100;
CHANNEL c2 from m1 2 to ct1 1 channelWidth=100;
CHANNEL c3 from m1 3 to ct2 1 channelWidth=100;
CHANNEL c4 from m1 4 to ct3 1 channelWidth=100;
CHANNEL c5 from m1 5 to ct4 1 channelWidth=100;
CHANNEL c6 from m1 6 to ct5 1 channelWidth=100;
CHANNEL c7 from m1 7 to ct6 1 channelWidth=100;
CHANNEL c8 from m1 8 to ct7 1 channelWidth=100;

CHANNEL c9 from ct1 2 to ct2 4 channelWidth=100;
CHANNEL c10 from ct2 2 to ct3 4 channelWidth=100;
CHANNEL c11 from ct3 2 to ct4 4 channelWidth=100;
CHANNEL c12 from ct4 2 to ct5 4 channelWidth=100;
CHANNEL c13 from ct5 2 to ct6 4 channelWidth=100;
CHANNEL c14 from ct6 2 to ct7 4 channelWidth=100;

CHANNEL c15 from ct1 3 to ct8 1 channelWidth=100;
CHANNEL c16 from ct2 3 to ct9 1 channelWidth=100;
CHANNEL c17 from ct3 3 to ct10 1 channelWidth=100;
CHANNEL c18 from ct4 3 to ct11 1 channelWidth=100;
CHANNEL c19 from ct5 3 to ct12 1 channelWidth=100;
CHANNEL c20 from ct6 3 to ct13 1 channelWidth=100;
CHANNEL c21 from ct7 3 to ct14 1 channelWidth=100;

CHANNEL c22 from ct8 2 to ct9 4 channelWidth=100;
CHANNEL c23 from ct9 2 to ct10 4 channelWidth=100;
CHANNEL c24 from ct10 2 to ct11 4 channelWidth=100;
CHANNEL c25 from ct11 2 to ct12 4 channelWidth=100;
CHANNEL c26 from ct12 2 to ct13 4 channelWidth=100;
CHANNEL c27 from ct13 2 to ct14 4 channelWidth=100;

CHANNEL c28 from ct8 3 to ct15 1 channelWidth=100;
CHANNEL c29 from ct9 3 to ct16 1 channelWidth=100;
CHANNEL c30 from ct10 3 to ct17 1 channelWidth=100;
CHANNEL c31 from ct11 3 to ct18 1 channelWidth=100;
CHANNEL c32 from ct12 3 to ct19 1 channelWidth=100;
CHANNEL c33 from ct13 3 to ct20 1 channelWidth=100;
CHANNEL c34 from ct14 3 to ct21 1 channelWidth=100;

CHANNEL c35 from ct15 2 to ct16 4 channelWidth=100;
CHANNEL c36 from ct16 2 to ct17 4 channelWidth=100;
CHANNEL c37 from ct17 2 to ct18 4 channelWidth=100;
CHANNEL c38 from ct18 2 to ct19 4 channelWidth=100;
CHANNEL c39 from ct19 2 to ct20 4 channelWidth=100;
CHANNEL c40 from ct20 2 to ct21 4 channelWidth=100;

CHANNEL c41 from ct15 3 to ct22 1 channelWidth=100;
CHANNEL c42 from ct16 3 to ct23 1 channelWidth=100;
CHANNEL c43 from ct17 3 to ct24 1 channelWidth=100;
CHANNEL c44 from ct18 3 to ct25 1 channelWidth=100;
CHANNEL c45 from ct19 3 to ct26 1 channelWidth=100;
CHANNEL c46 from ct20 3 to ct27 1 channelWidth=100;
CHANNEL c47 from ct21 3 to ct28 1 channelWidth=100;

CHANNEL c48 from ct22 2 to ct23 4 channelWidth=100;
CHANNEL c49 from ct23 2 to ct24 4 channelWidth=100;
CHANNEL c50 from ct24 2 to ct25 4 channelWidth=100;
CHANNEL c51 from ct25 2 to ct26 4 channelWidth=100;
CHANNEL c52 from ct26 2 to ct27 4 channelWidth=100;
CHANNEL c53 from ct27 2 to ct28 4 channelWidth=100;

CHANNEL c54 from ct22 3 to ct29 1 channelWidth=100;
CHANNEL c55 from ct23 3 to ct30 1 channelWidth=100;
CHANNEL c56 from ct24 3 to ct31 1 channelWidth=100;
CHANNEL c57 from ct25 3 to ct32 1 channelWidth=100;
CHANNEL c58 from ct26 3 to ct33 1 channelWidth=100;
CHANNEL c59 from ct27 3 to ct34 1 channelWidth=100;
CHANNEL c60 from ct28 3 to ct35 1 channelWidth=100;

CHANNEL c61 from ct29 2 to ct30 4 channelWidth=100;
CHANNEL c62 from ct30 2 to ct31 4 channelWidth=100;
CHANNEL c63 from ct31 2 to ct32 4 channelWidth=100;
CHANNEL c64 from ct32 2 to ct33 4 channelWidth=100;
CHANNEL c65 from ct33 2 to ct34 4 channelWidth=100;
CHANNEL c66 from ct34 2 to ct35 4 channelWidth=100;

CHANNEL c67 from ct29 3 to ct36 1 channelWidth=100;
CHANNEL c68 from ct30 3 to ct37 1 channelWidth=100;
CHANNEL c69 from ct31 3 to ct38 1 channelWidth=100;
CHANNEL c70 from ct32 3 to ct39 1 channelWidth=100;
CHANNEL c71 from ct33 3 to ct40 1 channelWidth=100;
CHANNEL c72 from ct34 3 to ct41 1 channelWidth=100;
CHANNEL c73 from ct35 3 to ct42 1 channelWidth=100;

CHANNEL c74 from ct36 2 to ct37 4 channelWidth=100;
CHANNEL c75 from ct37 2 to ct38 4 channelWidth=100;
CHANNEL c76 from ct38 2 to ct39 4 channelWidth=100;
CHANNEL c77 from ct39 2 to ct40 4 channelWidth=100;
CHANNEL c78 from ct40 2 to ct41 4 channelWidth=100;
CHANNEL c79 from ct41 2 to ct42 4 channelWidth=100;

CHANNEL c80 from ct36 3 to ct43 1 channelWidth=100;
CHANNEL c81 from ct37 3 to ct44 1 channelWidth=100;
CHANNEL c82 from ct38 3 to ct45 1 channelWidth=100;
CHANNEL c83 from ct39 3 to ct46 1 channelWidth=100;
CHANNEL c84 from ct40 3 to ct47 1 channelWidth=100;
CHANNEL c85 from ct41 3 to ct48 1 channelWidth=100;
CHANNEL c86 from ct42 3 to ct49 1 channelWidth=100;

CHANNEL c87 from ct43 2 to ct44 4 channelWidth=100;
CHANNEL c88 from ct44 2 to ct45 4 channelWidth=100;
CHANNEL c89 from ct45 2 to ct46 4 channelWidth=100;
CHANNEL c90 from ct46 2 to ct47 4 channelWidth=100;
CHANNEL c91 from ct47 2 to ct48 4 channelWidth=100;
CHANNEL c92 from ct48 2 to ct49 4 channelWidth=100;
CHANNEL c93 from ct43 3 to m2 1 channelWidth=100;
CHANNEL c94 from ct44 3 to m2 2 channelWidth=100;
CHANNEL c95 from ct45 3 to m2 3 channelWidth=100;
CHANNEL c96 from ct46 3 to m2 4 channelWidth=100;
CHANNEL c97 from ct47 3 to m2 5 channelWidth=100;
CHANNEL c98 from ct48 3 to m2 6 channelWidth=100;
CHANNEL c99 from ct49 3 to m2 7 channelWidth=100;
CHANNEL c100 from m2 8 to p2 1 channelWidth=100;

END LAYER

LAYER CONTROL
 V BANK cpb1 of 7  PORT portRadius=100  spacing=1500 ;
 V BANK cpb2 of 6  PORT portRadius=100  spacing=1500 ;

VALVE v1 on c9 w=100 l=300;
VALVE v2 on c10 w=100 l=300;
VALVE v3 on c11 w=100 l=300;
VALVE v4 on c12 w=100 l=300;
VALVE v5 on c13 w=100 l=300;
VALVE v6 on c14 w=100 l=300;

NET n1 from cpb1_1 to v1 3, v2 3, v3 3, v4 3, v5 3, v6 3 channelWidth=50;

VALVE v7 on c15 w=300 l=100;
VALVE v8 on c16 w=300 l=100;
VALVE v9 on c17 w=300 l=100;
VALVE v10 on c18 w=300 l=100;
VALVE v11 on c19 w=300 l=100;
VALVE v12 on c20 w=300 l=100;
VALVE v13 on c21 w=300 l=100;

CHANNEL cc1 from v7 2 to v8 4 channelWidth=50;
CHANNEL cc2 from v8 2 to v9 4 channelWidth=50;
CHANNEL cc3 from v9 2 to v10 4 channelWidth=50;
CHANNEL cc4 from v10 2 to v11 4 channelWidth=50;
CHANNEL cc5 from v11 2 to v12 4 channelWidth=50;
CHANNEL cc6 from v12 2 to v13 4 channelWidth=50;
CHANNEL cc7 from v13 2 to cpb2_1 channelWidth=50;

VALVE v14 on c22 w=100 l=300;
VALVE v15 on c23 w=100 l=300;
VALVE v16 on c24 w=100 l=300;
VALVE v17 on c25 w=100 l=300;
VALVE v18 on c26 w=100 l=300;
VALVE v19 on c27 w=100 l=300;

NET n2 from cpb1_2 to v14 3, v15 3, v16 3, v17 3, v18 3, v19 3 channelWidth=50;

VALVE v20 on c28 w=300 l=100;
VALVE v21 on c29 w=300 l=100;
VALVE v22 on c30 w=300 l=100;
VALVE v23 on c31 w=300 l=100;
VALVE v24 on c32 w=300 l=100;
VALVE v25 on c33 w=300 l=100;
VALVE v26 on c34 w=300 l=100;

CHANNEL cc8 from v20 2 to v21 4 channelWidth=50;
CHANNEL cc9 from v21 2 to v22 4 channelWidth=50;
CHANNEL cc10 from v22 2 to v23 4 channelWidth=50;
CHANNEL cc11 from v23 2 to v24 4 channelWidth=50;
CHANNEL cc12 from v24 2 to v25 4 channelWidth=50;
CHANNEL cc13 from v25 2 to v26 4 channelWidth=50;
CHANNEL cc14 from v26 2 to cpb2_2 channelWidth=50;

VALVE v27 on c35 w=100 l=300;
VALVE v28 on c36 w=100 l=300;
VALVE v29 on c37 w=100 l=300;
VALVE v30 on c38 w=100 l=300;
VALVE v31 on c39 w=100 l=300;
VALVE v32 on c40 w=100 l=300;

NET n3 from cpb1_3 to v27 3, v28 3, v29 3, v30 3, v31 3, v32 3 channelWidth=50;

VALVE v33 on c41 w=300 l=100;
VALVE v34 on c42 w=300 l=100;
VALVE v35 on c43 w=300 l=100;
VALVE v36 on c44 w=300 l=100;
VALVE v37 on c45 w=300 l=100;
VALVE v38 on c46 w=300 l=100;
VALVE v39 on c47 w=300 l=100;

CHANNEL cc15 from v33 2 to v34 4 channelWidth=50;
CHANNEL cc16 from v34 2 to v35 4 channelWidth=50;
CHANNEL cc17 from v35 2 to v36 4 channelWidth=50;
CHANNEL cc18 from v36 2 to v37 4 channelWidth=50;
CHANNEL cc19 from v37 2 to v38 4 channelWidth=50;
CHANNEL cc20 from v38 2 to v39 4 channelWidth=50;
CHANNEL cc21 from v39 2 to cpb2_3 channelWidth=50;

VALVE v40 on c48 w=100 l=300;
VALVE v41 on c49 w=100 l=300;
VALVE v42 on c50 w=100 l=300;
VALVE v43 on c51 w=100 l=300;
VALVE v44 on c52 w=100 l=300;
VALVE v45 on c53 w=100 l=300;

NET n4 from cpb1_4 to v40 3, v41 3, v42 3, v43 3, v44 3, v45 3 channelWidth=50;

VALVE v46 on c54 w=300 l=100;
VALVE v47 on c55 w=300 l=100;
VALVE v48 on c56 w=300 l=100;
VALVE v49 on c57 w=300 l=100;
VALVE v50 on c58 w=300 l=100;
VALVE v51 on c59 w=300 l=100;
VALVE v52 on c60 w=300 l=100;

CHANNEL cc22 from v46 2 to v47 4 channelWidth=50;
CHANNEL cc23 from v47 2 to v48 4 channelWidth=50;
CHANNEL cc24 from v48 2 to v49 4 channelWidth=50;
CHANNEL cc25 from v49 2 to v50 4 channelWidth=50;
CHANNEL cc26 from v50 2 to v51 4 channelWidth=50;
CHANNEL cc27 from v51 2 to v52 4 channelWidth=50;
CHANNEL cc28 from v52 2 to cpb2_4 channelWidth=50;

VALVE v53 on c61 w=100 l=300;
VALVE v54 on c62 w=100 l=300;
VALVE v55 on c63 w=100 l=300;
VALVE v56 on c64 w=100 l=300;
VALVE v57 on c65 w=100 l=300;
VALVE v58 on c66 w=100 l=300;

NET n5 from cpb1_5 to v53 3, v54 3, v55 3, v56 3, v57 3, v58 3 channelWidth=50;

VALVE v59 on c67 w=300 l=100;
VALVE v60 on c68 w=300 l=100;
VALVE v61 on c69 w=300 l=100;
VALVE v62 on c70 w=300 l=100;
VALVE v63 on c71 w=300 l=100;
VALVE v64 on c72 w=300 l=100;
VALVE v65 on c73 w=300 l=100;

CHANNEL cc29 from v59 2 to v60 4 channelWidth=50;
CHANNEL cc30 from v60 2 to v61 4 channelWidth=50;
CHANNEL cc31 from v61 2 to v62 4 channelWidth=50;
CHANNEL cc32 from v62 2 to v63 4 channelWidth=50;
CHANNEL cc33 from v63 2 to v64 4 channelWidth=50;
CHANNEL cc34 from v64 2 to v65 4 channelWidth=50;
CHANNEL cc35 from v65 2 to cpb2_5 channelWidth=50;

VALVE v66 on c74 w=100 l=300;
VALVE v67 on c75 w=100 l=300;
VALVE v68 on c76 w=100 l=300;
VALVE v69 on c77 w=100 l=300;
VALVE v70 on c78 w=100 l=300;
VALVE v71 on c79 w=100 l=300;

NET n6 from cpb1_6 to v66 3, v67 3, v68 3, v69 3, v70 3, v71 3 channelWidth=50;

VALVE v72 on c80 w=300 l=100;
VALVE v73 on c81 w=300 l=100;
VALVE v74 on c82 w=300 l=100;
VALVE v75 on c83 w=300 l=100;
VALVE v76 on c84 w=300 l=100;
VALVE v77 on c85 w=300 l=100;
VALVE v78 on c86 w=300 l=100;

CHANNEL cc36 from v72 2 to v73 4 channelWidth=50;
CHANNEL cc37 from v73 2 to v74 4 channelWidth=50;
CHANNEL cc38 from v74 2 to v75 4 channelWidth=50;
CHANNEL cc39 from v75 2 to v76 4 channelWidth=50;
CHANNEL cc40 from v76 2 to v77 4 channelWidth=50;
CHANNEL cc41 from v77 2 to v78 4 channelWidth=50;
CHANNEL cc42 from v78 2 to cpb2_6 channelWidth=50;

VALVE v79 on c87 w=100 l=300;
VALVE v80 on c88 w=100 l=300;
VALVE v81 on c89 w=100 l=300;
VALVE v82 on c90 w=100 l=300;
VALVE v83 on c91 w=100 l=300;
VALVE v84 on c92 w=100 l=300;

NET n7 from cpb1_7 to v79 3, v80 3, v81 3, v82 3, v83 3, v84 3 channelWidth=50;

END LAYER
