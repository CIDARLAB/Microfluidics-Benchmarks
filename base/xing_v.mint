DEVICE xing_v

LAYER FLOW
 H BANK b1 of 3  PORT portRadius=100  spacing=1500 ;
 H BANK b2 of 3  PORT portRadius=100  spacing=1500 ;

NODE n1, n2, n3, n4, n5, n6;

CHANNEL c1 from b1 1 to n1 1 channelWidth=100;
CHANNEL c2 from b1 2 to n2 1 channelWidth=100;
CHANNEL c3 from b1 3 to n3 1 channelWidth=100;
CHANNEL c4 from n1 3 to n4 1 channelWidth=100;
CHANNEL c5 from n2 3 to n5 1 channelWidth=100;
CHANNEL c6 from n3 3 to n6 1 channelWidth=100;
CHANNEL c7 from n4 3 to b2 1 channelWidth=100;
CHANNEL c8 from n5 3 to b2 2 channelWidth=100;
CHANNEL c9 from n6 3 to b2 3 channelWidth=100;
CHANNEL c10 from n1 2 to n2 4 channelWidth=100;
CHANNEL c11 from n2 2 to n3 4 channelWidth=100;

END LAYER

LAYER CONTROL
 PORT cp1 portRadius=100;
NODE cn1, cn2;
VALVE v1 on c10 width=100 length=200;
VALVE v2 on c11 width=100 length=200;

CHANNEL cc1 from v1 3 to cn1 1 channelWidth=50;
CHANNEL cc2 from v2 3 to cn2 1 channelWidth=50;
CHANNEL cc3 from cn1 2 to cn2 4 channelWidth=50;
CHANNEL cc4 from cn2 2 to cp1 4 channelWidth=50;

END LAYER