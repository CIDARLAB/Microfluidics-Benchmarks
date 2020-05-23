DEVICE position_constraint

LAYER FLOW

PORT p1, p2 portRadius=2000;

LONG CELL TRAP ct1;

CHANNEL c1 from p1 to ct1 channelWidth=400;
CHANNEL c2 from p2 to ct1 channelWidth=400.9;

p1 SET X 50 Y 50;


END LAYER