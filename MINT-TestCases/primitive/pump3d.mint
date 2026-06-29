DEVICE pump3d


LAYER flow

PORT p1, p2;

PUMP3D pump;

CHANNEL c1 from p1 to pump 1channelWidth=400;
CHANNEL c2 from p2 to pump 2channelWidth=400;

END layer

LAYER control

PORT cp1, cp2, cp3;

CHANNEL cc1 from cp1 to pump 3channelWidth=400;
CHANNEL cc2 from cp2 to pump 4channelWidth=400;
CHANNEL cc3 from cp3 to pump 5channelWidth=400;

END layer