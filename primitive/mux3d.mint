DEVICE mux3d

LAYER FLOW

PORT p_in, p_out1, p_out2, p_out3, p_out4;

MUX3D m 1 to 4;

CHANNEL ci1 from p_in to m 1 channelWidth=200;
CHANNEL co1 from m 2 to p_out1 channelWidth=200;
CHANNEL co2 from m 3 to p_out2 channelWidth=200;
CHANNEL co3 from m 4 to p_out3 channelWidth=200;
CHANNEL co4 from m 5 to p_out4 channelWidth=200;


END LAYER

LAYER CONTROL

PORT cp1, cp2, cp3, cp4;

CHANNEL cc1 from cp1 to m 6 channelWidth=400;
CHANNEL cc2 from cp2 to m 7 channelWidth=400;
CHANNEL cc3 from cp3 to m 8 channelWidth=400;
CHANNEL cc4 from cp4 to m 9 channelWidth=400;

END LAYER