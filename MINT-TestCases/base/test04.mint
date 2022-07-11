DEVICE test04

LAYER FLOW

 PORT p1, p2, p3 portRadius=500;
NODE n1;
H LONG CELL TRAP ct1 numberOfChambers=10 chamberWidth=500 chamberLength=500  chamberSpacing=100 feedingChannelWidth=500;

CHANNEL c3 from n1 2 to ct1 1 channelWidth=500;
CHANNEL c4 from ct1 2 to p3 4 channelWidth=500;
CHANNEL c1 from p1 3 to n1 1 channelWidth=500;
CHANNEL c2 from p2 1 to n1 3 channelWidth=500;

END LAYER

LAYER CONTROL

 PORT cp1, cp2 portRadius=500;
VALVE v1 on c1 width=1000 length=500;
VALVE v2 on c2 width=1000 length=500;
CHANNEL c5 from cp1 2 to v1 4 channelWidth=200;
CHANNEL c6 from cp2 2 to v2 4 channelWidth=200;

END LAYER

