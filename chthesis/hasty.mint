DEVICE hasty

LAYER FLOW

PORT p1, p2, p3, p4, p5 portRadius=100;
NODE n1, n2;
V TREE t1 1 to 8 spacing=500 flowChannelWidth=100;
V TREE t2 8 to 1 spacing=500 flowChannelWidth=100;
V BANK b1_1, b1_2, b1_3, b1_4, b1_5, b1_6, b1_7, b1_8 of 8 LONG CELL TRAP 
    numChambers=100 chamberWidth=100 chamberLength=100 chamberSpacing=30 spacing=500 channelWidth=100;
CHANNEL c1 from p1 to n1 channelWidth=100;
CHANNEL c2 from p2 to n1 channelWidth=100;
CHANNEL c3 from p3 to n1 channelWidth=100;
CHANNEL c4 from n1 to t1 1 channelWidth=100;
CHANNEL c5 from t1 2 to b1_1 channelWidth=100;
CHANNEL c6 from t1 3 to b1_2 channelWidth=100;
CHANNEL c7 from t1 4 to b1_3 channelWidth=100;
CHANNEL c8 from t1 5 to b1_4 channelWidth=100;
CHANNEL c9 from t1 6 to b1_5 channelWidth=100;
CHANNEL c10 from t1 7 to b1_6 channelWidth=100;
CHANNEL c11 from t1 8 to b1_7 channelWidth=100;
CHANNEL c12 from t1 9 to b1_8 channelWidth=100;
CHANNEL c13 from t2 1 to b1_1 channelWidth=100;
CHANNEL c14 from t2 2 to b1_2 channelWidth=100;
CHANNEL c15 from t2 3 to b1_3 channelWidth=100;
CHANNEL c16 from t2 4 to b1_4 channelWidth=100;
CHANNEL c17 from t2 5 to b1_5 channelWidth=100;
CHANNEL c18 from t2 6 to b1_6 channelWidth=100;
CHANNEL c19 from t2 7 to b1_7 channelWidth=100;
CHANNEL c20 from t2 8 to b1_8 channelWidth=100;
CHANNEL c21 from t2 9 to n2 channelWidth=100;
CHANNEL c22 from n2 to p4 channelWidth=100;
CHANNEL c23 from n2 to p5 channelWidth=100;

END LAYER
