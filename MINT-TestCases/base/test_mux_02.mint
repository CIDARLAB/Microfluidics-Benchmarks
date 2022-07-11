DEVICE test_mux_02 

LAYER FLOW

 PORT p1, p2, p3, p4, p5 portRadius=100;
NODE n1, n2, n3, n4, n5, n6, n7, n8, n9;

CHANNEL c13 from n8 2 to p5 4 channelWidth=100;
CHANNEL c11 from n7 3 to n8 1 channelWidth=100;
CHANNEL c12 from n9 1 to n8 3 channelWidth=100;
CHANNEL c9 from n2 2 to n7 4 channelWidth=100;
CHANNEL c10 from n5 2 to n9 4 channelWidth=100;
CHANNEL c5 from n1 3 to n2 1 channelWidth=100;
CHANNEL c6 from n3 1 to n2 3 channelWidth=100;
CHANNEL c7 from n4 3 to n5 1 channelWidth=100;
CHANNEL c8 from n6 1 to n5 3 channelWidth=100;

CHANNEL c1 from p1 2 to n1 4 channelWidth=100;
CHANNEL c2 from p2 2 to n3 4 channelWidth=100;
CHANNEL c3 from p3 2 to n4 4 channelWidth=100;
CHANNEL c4 from p4 2 to n6 4 channelWidth=100;

END LAYER

