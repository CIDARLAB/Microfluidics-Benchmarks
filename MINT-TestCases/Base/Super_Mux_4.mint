DEVICE Super_Mux_4
LAYER FLOW

H MUX mux_4 1 to 4 spacing=1000 flowChannelWidth=100 controlChannelWidth=20 width=1600 stageLength=3000;
PORT port_out portRadius=1000;
H BANK port_in of 4 PORT portRadius=1000 spacing=2200;

CHANNEL c_out from port_out 3 to mux_4 1 channelWidth=100;
CHANNEL cin1 from port_in 1 to mux_4 2 channelWidth=100;
CHANNEL cin2 from port_in 2 to mux_4 3 channelWidth=100;
CHANNEL cin3 from port_in 3 to mux_4 4 channelWidth=100;
CHANNEL cin4 from port_in 4 to mux_4 5 channelWidth=100;

END LAYER
LAYER CONTROL

PORT cp1, cp2, cp3, cp4 portRadius=1000;

CHANNEL cc1 from cp1 4 to mux_4 6 channelWidth=20;
CHANNEL cc2 from cp2 2 to mux_4 7 channelWidth=20;
CHANNEL cc3 from cp3 4 to mux_4 8 channelWidth=20;
CHANNEL cc4 from cp4 2 to mux_4 9 channelWidth=20;

END LAYER

