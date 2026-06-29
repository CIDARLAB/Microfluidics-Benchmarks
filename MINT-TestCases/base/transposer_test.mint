DEVICE transposer_test

VIA v1, v2;

LAYER flow

PORT p1, p2, p3, p4portRadius=500;
NODE n1, n2, n3, n4;

CHANNEL c1 from p1 to n1channelWidth=500;
CHANNEL c2_3 from n1 to n2channelWidth=500;
CHANNEL c4 from n2 to p2channelWidth=500;

CHANNEL c5 from p3 to n3channelWidth=500;
CHANNEL c6_7 from n3 to n4channelWidth=500;
CHANNEL c8 from n4 to p4channelWidth=500;

CHANNEL c9_11 from n1 to n4channelWidth=500;

CHANNEL c12_13 from n2 to v2channelWidth=500;
CHANNEL c14_15 from n3 to v1channelWidth=500;

END layer

LAYER control

PORT cp1, cp2portRadius=500;

VALVE3D v3d1 on c2_3radius=500 gap=200;
VALVE3D v3d2 on c9_11radius=500 gap=200;
VALVE3D v3d3 on c12_13radius=500 gap=200;
VALVE3D v3d4 on c14_15radius=500 gap=200;
VALVE3D v3d5 on c9_11radius=500 gap=200;
VALVE3D v3d6 on c6_7radius=500 gap=200;

NET n1 from cp1 4 to v3d1 1, v3d6 3channelWidth=500;
NET n2 from cp2 4 to v3d3 2, v3d5 2channelWidth=500;
CHANNEL cc1 from v3d2 2 to v3d4 4 channelWidth=500;
CHANNEL cc2 from v3d4 2 to v3d5 4 channelWidth=500;
CHANNEL cc3 from v1 6 to v2 8 channelWidth=500;

END layer
