DEVICE net_multi_test

LAYER FLOW
 V BANK b1 of 3  PORT portRadius=100  spacing=1500 ;
NODE n1, n2, n3;

CHANNEL c1 from b1 1 to n1 4 channelWidth=100;
CHANNEL c2 from b1 2 to n2 4 channelWidth=100;
CHANNEL c3 from b1 3 to n3 4 channelWidth=100;

CHANNEL c9 from n1 3 to n2 1 channelWidth=100;
CHANNEL c10 from n2 3 to n3 1 channelWidth=100;

END LAYER

LAYER CONTROL
 PORT cp1, cp2 portRadius=100;

VALVE v10 on c9 w=200 l=100;
VALVE v11 on c10 w=200 l=100;

NET cntrlnet1 from cp1 1 to v11 2, v10 2 channelWidth=50;

NET cntrlnet2 from cp2 1 to v11 4, v10 4 channelWidth=50;

END LAYER
