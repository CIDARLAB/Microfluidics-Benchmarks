DEVICE Super_Mux_64
LAYER FLOW

H MUX mux_64 1 to 64 spacing=1200 flowChannelWidth=100 controlChannelWidth=20 width=250 stageLength=2000;
PORT port_out portRadius=1000;
H BANK port_in of 64 PORT portRadius=1000 spacing=2200;

CHANNEL c_out from port_out 3 to mux_64 1 channelWidth=100;
CHANNEL cin1 from port_in 1 to mux_64 2 channelWidth=100;
CHANNEL cin2 from port_in 2 to mux_64 3 channelWidth=100;
CHANNEL cin3 from port_in 3 to mux_64 4 channelWidth=100;
CHANNEL cin4 from port_in 4 to mux_64 5 channelWidth=100;
CHANNEL cin5 from port_in 5 to mux_64 6 channelWidth=100;
CHANNEL cin6 from port_in 6 to mux_64 7 channelWidth=100;
CHANNEL cin7 from port_in 7 to mux_64 8 channelWidth=100;
CHANNEL cin8 from port_in 8 to mux_64 9 channelWidth=100;
CHANNEL cin9 from port_in 9 to mux_64 10 channelWidth=100;
CHANNEL cin10 from port_in 10 to mux_64 11 channelWidth=100;
CHANNEL cin11 from port_in 11 to mux_64 12 channelWidth=100;
CHANNEL cin12 from port_in 12 to mux_64 13 channelWidth=100;
CHANNEL cin13 from port_in 13 to mux_64 14 channelWidth=100;
CHANNEL cin14 from port_in 14 to mux_64 15 channelWidth=100;
CHANNEL cin15 from port_in 15 to mux_64 16 channelWidth=100;
CHANNEL cin16 from port_in 16 to mux_64 17 channelWidth=100;
CHANNEL cin17 from port_in 17 to mux_64 18 channelWidth=100;
CHANNEL cin18 from port_in 18 to mux_64 19 channelWidth=100;
CHANNEL cin19 from port_in 19 to mux_64 20 channelWidth=100;
CHANNEL cin20 from port_in 20 to mux_64 21 channelWidth=100;
CHANNEL cin21 from port_in 21 to mux_64 22 channelWidth=100;
CHANNEL cin22 from port_in 22 to mux_64 23 channelWidth=100;
CHANNEL cin23 from port_in 23 to mux_64 24 channelWidth=100;
CHANNEL cin24 from port_in 24 to mux_64 25 channelWidth=100;
CHANNEL cin25 from port_in 25 to mux_64 26 channelWidth=100;
CHANNEL cin26 from port_in 26 to mux_64 27 channelWidth=100;
CHANNEL cin27 from port_in 27 to mux_64 28 channelWidth=100;
CHANNEL cin28 from port_in 28 to mux_64 29 channelWidth=100;
CHANNEL cin29 from port_in 29 to mux_64 30 channelWidth=100;
CHANNEL cin30 from port_in 30 to mux_64 31 channelWidth=100;
CHANNEL cin31 from port_in 31 to mux_64 32 channelWidth=100;
CHANNEL cin32 from port_in 32 to mux_64 33 channelWidth=100;
CHANNEL cin33 from port_in 33 to mux_64 34 channelWidth=100;
CHANNEL cin34 from port_in 34 to mux_64 35 channelWidth=100;
CHANNEL cin35 from port_in 35 to mux_64 36 channelWidth=100;
CHANNEL cin36 from port_in 36 to mux_64 37 channelWidth=100;
CHANNEL cin37 from port_in 37 to mux_64 38 channelWidth=100;
CHANNEL cin38 from port_in 38 to mux_64 39 channelWidth=100;
CHANNEL cin39 from port_in 39 to mux_64 40 channelWidth=100;
CHANNEL cin40 from port_in 40 to mux_64 41 channelWidth=100;
CHANNEL cin41 from port_in 41 to mux_64 42 channelWidth=100;
CHANNEL cin42 from port_in 42 to mux_64 43 channelWidth=100;
CHANNEL cin43 from port_in 43 to mux_64 44 channelWidth=100;
CHANNEL cin44 from port_in 44 to mux_64 45 channelWidth=100;
CHANNEL cin45 from port_in 45 to mux_64 46 channelWidth=100;
CHANNEL cin46 from port_in 46 to mux_64 47 channelWidth=100;
CHANNEL cin47 from port_in 47 to mux_64 48 channelWidth=100;
CHANNEL cin48 from port_in 48 to mux_64 49 channelWidth=100;
CHANNEL cin49 from port_in 49 to mux_64 50 channelWidth=100;
CHANNEL cin50 from port_in 50 to mux_64 51 channelWidth=100;
CHANNEL cin51 from port_in 51 to mux_64 52 channelWidth=100;
CHANNEL cin52 from port_in 52 to mux_64 53 channelWidth=100;
CHANNEL cin53 from port_in 53 to mux_64 54 channelWidth=100;
CHANNEL cin54 from port_in 54 to mux_64 55 channelWidth=100;
CHANNEL cin55 from port_in 55 to mux_64 56 channelWidth=100;
CHANNEL cin56 from port_in 56 to mux_64 57 channelWidth=100;
CHANNEL cin57 from port_in 57 to mux_64 58 channelWidth=100;
CHANNEL cin58 from port_in 58 to mux_64 59 channelWidth=100;
CHANNEL cin59 from port_in 59 to mux_64 60 channelWidth=100;
CHANNEL cin60 from port_in 60 to mux_64 61 channelWidth=100;
CHANNEL cin61 from port_in 61 to mux_64 62 channelWidth=100;
CHANNEL cin62 from port_in 62 to mux_64 63 channelWidth=100;
CHANNEL cin63 from port_in 63 to mux_64 64 channelWidth=100;
CHANNEL cin64 from port_in 64 to mux_64 65 channelWidth=100;

END LAYER
LAYER CONTROL

PORT cp1, cp2, cp3, cp4, cp5, cp6, cp7, cp8, cp9, cp10, cp11, cp12 portRadius=1000;

CHANNEL cc1 from cp1 4 to mux_64 66 channelWidth=20;
CHANNEL cc2 from cp2 2 to mux_64 67 channelWidth=20;
CHANNEL cc3 from cp3 4 to mux_64 68 channelWidth=20;
CHANNEL cc4 from cp4 2 to mux_64 69 channelWidth=20;
CHANNEL cc5 from cp5 4 to mux_64 70 channelWidth=20;
CHANNEL cc6 from cp6 2 to mux_64 71 channelWidth=20;
CHANNEL cc7 from cp7 4 to mux_64 72 channelWidth=20;
CHANNEL cc8 from cp8 2 to mux_64 73 channelWidth=20;
CHANNEL cc9 from cp9 4 to mux_64 74 channelWidth=20;
CHANNEL cc10 from cp10 2 to mux_64 75 channelWidth=20;
CHANNEL cc11 from cp11 4 to mux_64 76 channelWidth=20;
CHANNEL cc12 from cp12 2 to mux_64 77 channelWidth=20;

END LAYER

