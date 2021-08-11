DEVICE rotary16

LAYER FLOW

H BANK pb1 of 16  PORT portRadius=100  spacing=1200 ;
H MUX m1 1 to 16 spacing=500 width=400 length=100 stageLength=1000 flowChannelWidth=100 controlChannelWidth=50;
V ROTARY MIXER rp radius=1000 flowChannelWidth=100 controlChannelWidth=50 valveWidth=200 valveLength=200 valveSpacing=400 height=30;
H BANK pb2 of 16  PORT portRadius=100  spacing=1200 ;
H MUX m2 1 to 16 spacing=500 width=400 length=100 stageLength=1000 flowChannelWidth=100 controlChannelWidth=50;
CHANNEL c1 from pb1_1 to m1 1 channelWidth=100;
CHANNEL c2 from pb1_2 to m1 2 channelWidth=100;
CHANNEL c3 from pb1_3 to m1 3 channelWidth=100;
CHANNEL c4 from pb1_4 to m1 4 channelWidth=100;
CHANNEL c5 from pb1_5 to m1 5 channelWidth=100;
CHANNEL c6 from pb1_6 to m1 6 channelWidth=100;
CHANNEL c7 from pb1_7 to m1 7 channelWidth=100;
CHANNEL c8 from pb1_8 to m1 8 channelWidth=100;
CHANNEL c9 from pb1_9 to m1 9 channelWidth=100;
CHANNEL c10 from pb1_10 to m1 10 channelWidth=100;
CHANNEL c11 from pb1_11 to m1 11 channelWidth=100;
CHANNEL c12 from pb1_12 to m1 12 channelWidth=100;
CHANNEL c13 from pb1_13 to m1 13 channelWidth=100;
CHANNEL c14 from pb1_14 to m1 14 channelWidth=100;
CHANNEL c15 from pb1_15 to m1 15 channelWidth=100;
CHANNEL c16 from pb1_16 to m1 16 channelWidth=100;
CHANNEL c17 from m1 17 to rp 1 channelWidth=100;
CHANNEL c18 from rp 2 to m2 1 channelWidth=100;
CHANNEL c19 from m2 2 to pb2_1 channelWidth=100;
CHANNEL c20 from m2 3 to pb2_2 channelWidth=100;
CHANNEL c21 from m2 4 to pb2_3 channelWidth=100;
CHANNEL c22 from m2 5 to pb2_4 channelWidth=100;
CHANNEL c23 from m2 6 to pb2_5 channelWidth=100;
CHANNEL c24 from m2 7 to pb2_6 channelWidth=100;
CHANNEL c25 from m2 8 to pb2_7 channelWidth=100;
CHANNEL c26 from m2 9 to pb2_8 channelWidth=100;
CHANNEL c27 from m2 10 to pb2_9 channelWidth=100;
CHANNEL c28 from m2 11 to pb2_10 channelWidth=100;
CHANNEL c29 from m2 12 to pb2_11 channelWidth=100;
CHANNEL c30 from m2 13 to pb2_12 channelWidth=100;
CHANNEL c31 from m2 14 to pb2_13 channelWidth=100;
CHANNEL c32 from m2 15 to pb2_14 channelWidth=100;
CHANNEL c33 from m2 16 to pb2_15 channelWidth=100;
CHANNEL c34 from m2 17 to pb2_16 channelWidth=100;

END LAYER

LAYER CONTROL

V BANK cpb1 of 4  PORT portRadius=100  spacing=1200 ;
V BANK cpb2 of 4  PORT portRadius=100  spacing=1200 ;
V BANK cpb3 of 2  PORT portRadius=100  spacing=1200 ;
V BANK cpb4 of 3  PORT portRadius=100  spacing=1200 ;
V BANK cpb5 of 4  PORT portRadius=100  spacing=1200 ;
V BANK cpb6 of 4  PORT portRadius=100  spacing=1200 ;
CHANNEL cc1 from m1 18 to cpb1_1 channelWidth=50;
CHANNEL cc2 from m1 20 to cpb1_2 channelWidth=50;
CHANNEL cc3 from m1 22 to cpb1_3 channelWidth=50;
CHANNEL cc4 from m1 24 to cpb1_4 channelWidth=50;
CHANNEL cc5 from m1 19 to cpb2_1 channelWidth=50;
CHANNEL cc6 from m1 21 to cpb2_2 channelWidth=50;
CHANNEL cc7 from m1 23 to cpb2_3 channelWidth=50;
CHANNEL cc8 from m1 25 to cpb2_4 channelWidth=50;
CHANNEL cc9 from m2 18 to cpb6_1 channelWidth=50;
CHANNEL cc10 from m2 20 to cpb6_2 channelWidth=50;
CHANNEL cc11 from m2 22 to cpb6_3 channelWidth=50;
CHANNEL cc12 from m2 24 to cpb6_4 channelWidth=50;
CHANNEL cc13 from m2 19 to cpb5_1 channelWidth=50;
CHANNEL cc14 from m2 21 to cpb5_2 channelWidth=50;
CHANNEL cc15 from m2 23 to cpb5_3 channelWidth=50;
CHANNEL cc16 from m2 25 to cpb5_4 channelWidth=50;
CHANNEL cc17 from rp 4 to cpb3_1 channelWidth=50;
CHANNEL cc18 from rp 5 to cpb3_2 channelWidth=50;
CHANNEL cc19 from rp 3 to cpb4_1 channelWidth=50;
CHANNEL cc20 from rp 6 to cpb4_2 channelWidth=50;
CHANNEL cc21 from rp 7 to cpb4_3 channelWidth=50;

END LAYER
