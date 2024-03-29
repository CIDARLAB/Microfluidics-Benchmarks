DEVICE net_valve_test

LAYER FLOW
V BANK b1 of 8  PORT portRadius=100  spacing=1500 ;
H MUX m2 1 to 2 spacing=1500 flowChannelWidth=100 controlChannelWidth=20;
H BANK b3 of 2  PORT portRadius=100  spacing=1500 ;
NODE n1, n2, n3, n4, n5, n6, n7, n8;

CHANNEL c1 from b1 1 to n1 4 channelWidth=100;
CHANNEL c2 from b1 2 to n2 4 channelWidth=100;
CHANNEL c3 from b1 3 to n3 4 channelWidth=100;
CHANNEL c4 from b1 4 to n4 4 channelWidth=100;
CHANNEL c5 from b1 5 to n5 4 channelWidth=100;
CHANNEL c6 from b1 6 to n6 4 channelWidth=100;
CHANNEL c7 from b1 7 to n7 4 channelWidth=100;
CHANNEL c8 from b1 8 to n8 4 channelWidth=100;

CHANNEL c9 from n1 3 to n2 1 channelWidth=100;
CHANNEL c10 from n2 3 to n3 1 channelWidth=100;
CHANNEL c11 from n3 3 to n4 1 channelWidth=100;
CHANNEL c12 from n4 3 to n5 1 channelWidth=100;
CHANNEL c13 from n5 3 to n6 1 channelWidth=100;
CHANNEL c14 from n6 3 to n7 1 channelWidth=100;
CHANNEL c15 from n7 3 to n8 1 channelWidth=100;

CHANNEL c49 from n1 1 to m2 3 channelWidth=100;
CHANNEL c50 from b3 1 to m2 1 channelWidth=100;
CHANNEL c51 from b3 2 to m2 2 channelWidth=100;

END LAYER

LAYER CONTROL
 PORT cp1, cp2, cp4 portRadius=100;

CHANNEL cm1 from cp1 2 to m2 4 channelWidth=50;
CHANNEL cm2 from cp2 3 to m2 5 channelWidth=50;


VALVE v9 on c49 width=200 length=100;
VALVE v10 on c9 width=200 length=100;
VALVE v11 on c10 width=200 length=100;
VALVE v12 on c11 width=200 length=100;
VALVE v13 on c12 width=200 length=100;
VALVE v14 on c13 width=200 length=100;
VALVE v15 on c14 width=200 length=100;
VALVE v16 on c15 width=200 length=100;
NET nt1 from cp4 1 to v16 4, v10 4, v11 4, v12 4, v13 4, v14 4, v15 4, v9 4 channelWidth=50;


END LAYER
