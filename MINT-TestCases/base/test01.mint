DEVICE test01

LAYER FLOW
 PORT p1, p2, p3 portRadius=500;
NODE n1;
H LONG CELL TRAP ct1 numberOfChambers=10 chamberWidth=500 chamberLength=500 chamberSpacing=100 feedingChannelWidth=500 ;

CHANNEL c1 from p1 3 to n1 1 channelWidth=500;
CHANNEL c2 from p2 1 to n1 3 channelWidth=500;
CHANNEL c3 from n1 2 to ct1 1 channelWidth=500;
CHANNEL c4 from ct1 2 to p3 4 channelWidth=500;

p1 SET X 2000 Y 0;
p2 SET X 2000 Y 10000;
n1 SET X 2500 Y 5000;
ct1 SET X 3500 Y 4250;
p3 SET X 12000 Y 4500;

END LAYER

LAYER CONTROL
 PORT cp1, cp2 portRadius=500;
VALVE v1 on c1 width=1000 length=500;
VALVE v2 on c2 width=1000 length=500;
CHANNEL c5 from cp1 2 to v1 4 channelWidth=500;
CHANNEL c6 from cp2 2 to v2 4 channelWidth=500;

cp1 SET X 0 Y 3500;
cp2 SET X 0 Y 6000;
v1 SET X 2000 Y 3750;
v2 SET X 2000 Y 6250;

END LAYER
