DEVICE logic04

LAYER FLOW

LOGIC ARRAY la flowChannelWidth=100 controlChannelWidth=50 chamberLength=100 
    chamberWidth=100 r=100;
V BANK b0_1, b0_2, b0_3, b0_3, b0_4, b0_5, b0_6, b0_7, b0_8 of 8 PORT portRadius=100 
    spacing=1500;
V MUX m1 8 to 1 spacing=1500 flowChannelWidth=100 controlChannelWidth=50;

NODE n1;
CHANNEL c0 from m1 9 to n1 channelWidth=100;
CHANNEL c1 from n1 to la 3 channelWidth=100;
CHANNEL c2 from n1 to la 2 channelWidth=100;
CHANNEL c3 from la 1 to n1 channelWidth=100;
CHANNEL c4 from b0_1 to m1 1 channelWidth=100;
CHANNEL c5 from b0_2 to m1 2 channelWidth=100;
CHANNEL c6 from b0_3 to m1 3 channelWidth=100;
CHANNEL c7 from b0_4 to m1 4 channelWidth=100;
CHANNEL c8 from b0_5 to m1 5 channelWidth=100;
CHANNEL c9 from b0_6 to m1 6 channelWidth=100;
CHANNEL c10 from b0_7 to m1 7 channelWidth=100;
CHANNEL c11 from b0_8 to m1 8 channelWidth=100;

END LAYER

LAYER CONTROL

H BANK b4_1, b4_2, b4_3, b4_4, b4_5 of 5 PORT portRadius=100 spacing=1200;
H BANK b5_1, b5_2, b5_3, b5_4 of 4 PORT r=100 spacing=1200 channelWidth=50;
CHANNEL cc21 from m1 10 to b4_1 channelWidth=50;
CHANNEL cc22 from m1 11 to b5_1 channelWidth=50;
CHANNEL cc23 from m1 12 to b4_2 channelWidth=50;
CHANNEL cc24 from m1 13 to b5_2 channelWidth=50;
CHANNEL cc25 from m1 14 to b4_3 channelWidth=50;
CHANNEL cc26 from m1 15 to b5_3 channelWidth=50;
CHANNEL cca from la 24 to b4_4 channelWidth=50;
CHANNEL ccb from la 25 to b4_5 channelWidth=50;
CHANNEL ccc from la 26 to b5_4 channelWidth=50;
H BANK b1_1, b1_2, b1_3, b1_4, b1_5 of 5 PORT r=100 spacing=1200 channelWidth=50;
H BANK b3_1, b3_2, b3_3, b3_4, b3_5 of 5 PORT r=100 spacing=1200 channelWidth=50;
V BANK b2_1, b2_2, b2_3, b2_4, b2_5, 
    b2_6, b2_7, b2_8, b2_9, b2_10 of 10 PORT r=100 spacing=1200 channelWidth=50;
CHANNEL cc10 from la 13 to b2_5 channelWidth=50;
CHANNEL cc11 from la 14 to b2_6 channelWidth=50;
CHANNEL cc9 from la 12 to b2_4 channelWidth=50;
CHANNEL cc12 from la 15 to b2_7 channelWidth=50;
CHANNEL cc8 from la 11 to b2_3 channelWidth=50;
CHANNEL cc13 from la 16 to b2_8 channelWidth=50;
CHANNEL cc7 from la 10 to b2_2 channelWidth=50;
CHANNEL cc14 from la 17 to b2_9 channelWidth=50;
CHANNEL cc6 from la 9 to b2_1 channelWidth=50;
CHANNEL cc15 from la 18 to b2_10 channelWidth=50;
CHANNEL cc1 from b1_1 to la 4 channelWidth=50;
CHANNEL cc5 from b1_5 to la 8 channelWidth=50;
CHANNEL cc2 from b1_2 to la 5 channelWidth=50;
CHANNEL cc4 from b1_4 to la 7 channelWidth=50;
CHANNEL cc3 from b1_3 to la 6 channelWidth=50;
CHANNEL cc16 from b3_1 to la 19 channelWidth=50;
CHANNEL cc17 from b3_2 to la 20 channelWidth=50;
CHANNEL cc18 from b3_3 to la 21 channelWidth=50;
CHANNEL cc19 from b3_4 to la 22 channelWidth=50;
CHANNEL cc20 from b3_5 to la 23 channelWidth=50;

END LAYER