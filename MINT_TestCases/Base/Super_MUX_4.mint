DEVICE Super_MUX_4
LAYER FLOW

H MUX mux_4 1 to 4 leafPitch=4000 flowChannelWidth=500 controlChannelWidth=100 width=1800 length=500 stageLength=3000;
PORT port_out portRadius=1000;
H BANK port_in of 4 PORT portRadius=1000 spacing=4000;

CHANNEL c_out from port_out 3 to mux_4 1 channelWidth=500;
CHANNEL cin1 from port_in 1 to mux_4 2 channelWidth=500;
CHANNEL cin2 from port_in 2 to mux_4 3 channelWidth=500;
CHANNEL cin3 from port_in 3 to mux_4 4 channelWidth=500;
CHANNEL cin4 from port_in 4 to mux_4 5 channelWidth=500;

END LAYER
LAYER CONTROL

PORT cp1, cp2, cp3, cp4 portRadius=1000;

CHANNEL cc1 from cp1 4 to mux_4 6 channelWidth=100;
CHANNEL cc2 from cp2 2 to mux_4 7 channelWidth=100;
CHANNEL cc3 from cp3 4 to mux_4 8 channelWidth=100;
CHANNEL cc4 from cp4 2 to mux_4 9 channelWidth=100;

END LAYER

