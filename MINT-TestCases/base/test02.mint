DEVICE test02

LAYER FLOW

 PORT p1, p2, p3, p4 portRadius=500;
SQUARE CELL TRAP ct1 chamberWidth=500 chamberLength=500 channelWidth=500;

CHANNEL c1 from p1 3 to ct1 1 channelWidth=500;
CHANNEL c2 from p2 4 to ct1 2 channelWidth=500;
CHANNEL c3 from p3 1 to ct1 3 channelWidth=500;
CHANNEL c4 from p4 2 to ct1 4 channelWidth=500;

ct1 SET X 4250 Y 4250;
p1 SET X 4500 Y 0;
p3 SET X 4500 Y 9000;
p2 SET X 9000 Y 4500;
p4 SET X 0 Y 4500;

END LAYER

LAYER CONTROL

 PORT cp1, cp2, cp3, cp4 portRadius=500;
VALVE v1 on c1 width=1000 length=500;
VALVE v3 on c3 width=1000 length=500;
VALVE v2 on c2 width=500 length=1000;
VALVE v4 on c4 width=500 length=1000;
CHANNEL c5 from cp1 4 to v1 2 channelWidth=500;
CHANNEL c6 from cp2 1 to v2 3 channelWidth=500;
CHANNEL c7 from cp3 2 to v3 4 channelWidth=500;
CHANNEL c8 from cp4 3 to v4 1 channelWidth=500;

cp1 SET X 9000 Y 2000;
cp2 SET X 7000 Y 9000;
cp3 SET X 0 Y 7000;
cp4 SET X 2000 Y 0;

END LAYER
