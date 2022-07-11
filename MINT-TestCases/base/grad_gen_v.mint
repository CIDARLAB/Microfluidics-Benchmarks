DEVICE grad_gen_v

LAYER FLOW
 H BANK b of 4  PORT portRadius=100  spacing=1500 ;
NODE n1, n2, n3, n4, n5;
V GRADIENT GENERATOR g 3 to 7 numberOfBends=5 bendSpacing=100 bendLength=500 channelWidth=100;
 PORT p1 portRadius=100;

CHANNEL c1 from b 1 to n1 4 channelWidth=100;
CHANNEL c2 from b 2 to n2 1 channelWidth=100;
CHANNEL c3 from b 3 to n4 1 channelWidth=100;
CHANNEL c4 from b 4 to n5 2 channelWidth=100;
CHANNEL c5 from n1 2 to n2 4 channelWidth=100;
CHANNEL c6 from n2 2 to n3 4 channelWidth=100;
CHANNEL c7 from n3 2 to n4 4 channelWidth=100;
CHANNEL c8 from n4 2 to n5 4 channelWidth=100;

CHANNEL c9 from n1 3 to g 1 channelWidth=100;
CHANNEL c10 from n3 3 to g 2 channelWidth=100;
CHANNEL c11 from n5 3 to g 3 channelWidth=100;

CHANNEL c12 from g 4 to p1 1 channelWidth=100;
END LAYER
