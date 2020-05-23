DEVICE node_test_01

LAYER FLOW

H MUX m1 1 to 8 r=100 flowChannelWidth=100 controlChannelWidth=20;
NODE n1;
 PORT p1, p2, p3 portRadius=100;

CHANNEL c0 from m1 1 to n1 4 channelWidth=100;
CHANNEL c1 from n1 2 to p1 4 channelWidth=100;
CHANNEL c2 from n1 3 to p2 4 channelWidth=100;
CHANNEL c3 from n1 1 to p3 4 channelWidth=100;

END LAYER

LAYER CONTROL

VALVE v1 on c1 w=100 l=200;
VALVE v2 on c3 w=200 l=100;
VALVE v3 on c2 w=200 l=100;
 PORT cp1, cp2, cp3 portRadius=100;

CHANNEL cca from cp1 3 to v1 1 channelWidth=20;
CHANNEL ccb from cp2 1 to v3 4 channelWidth=20;
CHANNEL ccc from cp3 3 to v2 4 channelWidth=20;

END LAYER
