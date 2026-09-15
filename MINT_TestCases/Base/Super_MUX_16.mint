DEVICE Super_MUX_16
LAYER FLOW

H MUX mux_16 1 to 16 leafPitch=4000 flowChannelWidth=500 controlChannelWidth=100 width=1800 length=500 stageLength=3000;
PORT port_out portRadius=1000;
H BANK port_in of 16 PORT portRadius=1000 spacing=4000;

CHANNEL c_out from port_out 3 to mux_16 1 channelWidth=500;
CHANNEL cin1 from port_in 1 to mux_16 2 channelWidth=500;
CHANNEL cin2 from port_in 2 to mux_16 3 channelWidth=500;
CHANNEL cin3 from port_in 3 to mux_16 4 channelWidth=500;
CHANNEL cin4 from port_in 4 to mux_16 5 channelWidth=500;
CHANNEL cin5 from port_in 5 to mux_16 6 channelWidth=500;
CHANNEL cin6 from port_in 6 to mux_16 7 channelWidth=500;
CHANNEL cin7 from port_in 7 to mux_16 8 channelWidth=500;
CHANNEL cin8 from port_in 8 to mux_16 9 channelWidth=500;
CHANNEL cin9 from port_in 9 to mux_16 10 channelWidth=500;
CHANNEL cin10 from port_in 10 to mux_16 11 channelWidth=500;
CHANNEL cin11 from port_in 11 to mux_16 12 channelWidth=500;
CHANNEL cin12 from port_in 12 to mux_16 13 channelWidth=500;
CHANNEL cin13 from port_in 13 to mux_16 14 channelWidth=500;
CHANNEL cin14 from port_in 14 to mux_16 15 channelWidth=500;
CHANNEL cin15 from port_in 15 to mux_16 16 channelWidth=500;
CHANNEL cin16 from port_in 16 to mux_16 17 channelWidth=500;

END LAYER
LAYER CONTROL

PORT cp1, cp2, cp3, cp4, cp5, cp6, cp7, cp8 portRadius=1000;

CHANNEL cc1 from cp1 4 to mux_16 18 channelWidth=100;
CHANNEL cc2 from cp2 2 to mux_16 19 channelWidth=100;
CHANNEL cc3 from cp3 4 to mux_16 20 channelWidth=100;
CHANNEL cc4 from cp4 2 to mux_16 21 channelWidth=100;
CHANNEL cc5 from cp5 4 to mux_16 22 channelWidth=100;
CHANNEL cc6 from cp6 2 to mux_16 23 channelWidth=100;
CHANNEL cc7 from cp7 4 to mux_16 24 channelWidth=100;
CHANNEL cc8 from cp8 2 to mux_16 25 channelWidth=100;

END LAYER

