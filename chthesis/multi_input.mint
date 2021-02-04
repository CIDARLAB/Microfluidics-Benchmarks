DEVICE multi_input

LAYER FLOW

H BANK pb1 of 2  PORT portRadius=100  spacing=1200 ;
V BANK pb2 of 2  PORT portRadius=100  spacing=1200 ;
V BANK pb3 of 2  PORT portRadius=100  spacing=1200 ;
H MUX m1 2 to 1 spacing=1200 flowChannelWidth=100 controlChannelWidth=50;
V TREE t1 2 to 1 spacing=1200 flowChannelWidth=100;
V TREE t2 1 to 2 spacing=1200 flowChannelWidth=100;
H MIXER x1 numberOfBends=10 bendSpacing=100 bendLength=1000 channelWidth=100;
H MIXER x2 numberOfBends=10 bendSpacing=100 bendLength=1000 channelWidth=100;
PORT p1 portRadius=100;
SQUARE CELL TRAP ct1 chamberWidth=500 chamberLength=500 channelWidth=100;
CHANNEL c1 from pb1_1 to m1 1 channelWidth=100;
CHANNEL c2 from pb1_2 to m1 2 channelWidth=100;
CHANNEL c3 from m1 3 to ct1 1 channelWidth=100;
CHANNEL c4 from pb2_1 to t1 1 channelWidth=100;
CHANNEL c5 from pb2_2 to t1 2 channelWidth=100;
CHANNEL c6 from t1 3 to x1 1 channelWidth=100;
CHANNEL c7 from x1 2 to ct1 4 channelWidth=100;
CHANNEL c8 from pb3_1 to t2 2 channelWidth=100;
CHANNEL c9 from pb3_2 to t2 3 channelWidth=100;
CHANNEL c10 from t2 1 to x2 2 channelWidth=100;
CHANNEL c11 from x2 1 to ct1 2 channelWidth=100;
CHANNEL c12 from ct1 3 to p1 channelWidth=100;

END LAYER

LAYER CONTROL

PORT cp1, cp2, cp3, cp4 portRadius=100;
CHANNEL cc1 from cp1 to m1 4 channelWidth=50;
CHANNEL cc2 from cp2 to m1 5 channelWidth=50;
VALVE v1 on c7 w=150 l=300;
VALVE v2 on c11 w=150 l=300;
CHANNEL cc3 from cp3 to v1 channelWidth=50;
CHANNEL cc4 from cp4 to v2 channelWidth=50;

END LAYER