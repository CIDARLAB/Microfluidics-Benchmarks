DEVICE Super_Mux_2
LAYER FLOW

H MUX mux_2 1 to 2 spacing=1000 flowChannelWidth=100 controlChannelWidth=20 width=1600 stageLength=3000;
PORT port_out portRadius=1000;
H BANK port_in of 2 PORT portRadius=1000 spacing=2200;

CHANNEL c_out from port_out 3 to mux_2 1 channelWidth=100;
CHANNEL cin1 from port_in 1 to mux_2 2 channelWidth=100;
CHANNEL cin2 from port_in 2 to mux_2 3 channelWidth=100;

END LAYER
LAYER CONTROL

PORT cp1, cp2 portRadius=1000;

CHANNEL cc1 from cp1 4 to mux_2 4 channelWidth=20;
CHANNEL cc2 from cp2 2 to mux_2 5 channelWidth=20;

END LAYER

