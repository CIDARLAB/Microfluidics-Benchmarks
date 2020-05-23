DEVICE relative_orientation_constraint

LAYER FLOW

PORT pin, pout portRadius=2000;

V LONG CELL TRAP ct1;
H LONG CELL TRAP ct2;
V LONG CELL TRAP ct3;

CHANNEL c1 from pin to ct1 channelWidth=100;
CHANNEL c2 from ct1 to ct2 channelWidth=100;
CHANNEL c3 from ct2 to ct3 channelWidth=100;

END LAYER