DEVICE Super_Mux_32
LAYER FLOW

H MUX mux_32 1 to 32 leafPitch=4000 flowChannelWidth=500 controlChannelWidth=100 width=1800 length=500 stageLength=3000;
PORT port_out portRadius=1000;
H BANK port_in of 32 PORT portRadius=1000 spacing=4000;

CHANNEL c_out from port_out 3 to mux_32 1 channelWidth=500;
CHANNEL cin1 from port_in 1 to mux_32 2 channelWidth=500;
CHANNEL cin2 from port_in 2 to mux_32 3 channelWidth=500;
CHANNEL cin3 from port_in 3 to mux_32 4 channelWidth=500;
CHANNEL cin4 from port_in 4 to mux_32 5 channelWidth=500;
CHANNEL cin5 from port_in 5 to mux_32 6 channelWidth=500;
CHANNEL cin6 from port_in 6 to mux_32 7 channelWidth=500;
CHANNEL cin7 from port_in 7 to mux_32 8 channelWidth=500;
CHANNEL cin8 from port_in 8 to mux_32 9 channelWidth=500;
CHANNEL cin9 from port_in 9 to mux_32 10 channelWidth=500;
CHANNEL cin10 from port_in 10 to mux_32 11 channelWidth=500;
CHANNEL cin11 from port_in 11 to mux_32 12 channelWidth=500;
CHANNEL cin12 from port_in 12 to mux_32 13 channelWidth=500;
CHANNEL cin13 from port_in 13 to mux_32 14 channelWidth=500;
CHANNEL cin14 from port_in 14 to mux_32 15 channelWidth=500;
CHANNEL cin15 from port_in 15 to mux_32 16 channelWidth=500;
CHANNEL cin16 from port_in 16 to mux_32 17 channelWidth=500;
CHANNEL cin17 from port_in 17 to mux_32 18 channelWidth=500;
CHANNEL cin18 from port_in 18 to mux_32 19 channelWidth=500;
CHANNEL cin19 from port_in 19 to mux_32 20 channelWidth=500;
CHANNEL cin20 from port_in 20 to mux_32 21 channelWidth=500;
CHANNEL cin21 from port_in 21 to mux_32 22 channelWidth=500;
CHANNEL cin22 from port_in 22 to mux_32 23 channelWidth=500;
CHANNEL cin23 from port_in 23 to mux_32 24 channelWidth=500;
CHANNEL cin24 from port_in 24 to mux_32 25 channelWidth=500;
CHANNEL cin25 from port_in 25 to mux_32 26 channelWidth=500;
CHANNEL cin26 from port_in 26 to mux_32 27 channelWidth=500;
CHANNEL cin27 from port_in 27 to mux_32 28 channelWidth=500;
CHANNEL cin28 from port_in 28 to mux_32 29 channelWidth=500;
CHANNEL cin29 from port_in 29 to mux_32 30 channelWidth=500;
CHANNEL cin30 from port_in 30 to mux_32 31 channelWidth=500;
CHANNEL cin31 from port_in 31 to mux_32 32 channelWidth=500;
CHANNEL cin32 from port_in 32 to mux_32 33 channelWidth=500;

END LAYER
LAYER CONTROL

PORT cp1, cp2, cp3, cp4, cp5, cp6, cp7, cp8, cp9, cp10 portRadius=1000;

CHANNEL cc1 from cp1 4 to mux_32 34 channelWidth=100;
CHANNEL cc2 from cp2 2 to mux_32 35 channelWidth=100;
CHANNEL cc3 from cp3 4 to mux_32 36 channelWidth=100;
CHANNEL cc4 from cp4 2 to mux_32 37 channelWidth=100;
CHANNEL cc5 from cp5 4 to mux_32 38 channelWidth=100;
CHANNEL cc6 from cp6 2 to mux_32 39 channelWidth=100;
CHANNEL cc7 from cp7 4 to mux_32 40 channelWidth=100;
CHANNEL cc8 from cp8 2 to mux_32 41 channelWidth=100;
CHANNEL cc9 from cp9 4 to mux_32 42 channelWidth=100;
CHANNEL cc10 from cp10 2 to mux_32 43 channelWidth=100;

END LAYER

