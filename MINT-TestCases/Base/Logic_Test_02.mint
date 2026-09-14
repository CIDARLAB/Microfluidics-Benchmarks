DEVICE Logic_Test_02
LAYER FLOW

LOGIC ARRAY logic_array_1 flowChannelWidth=200 controlChannelWidth=100 chamberLength=100 chamberWidth=100;
LOGIC ARRAY logic_array_2 flowChannelWidth=200 controlChannelWidth=100 chamberLength=100 chamberWidth=100;

PORT logic_array_1_flow_1, logic_array_1_flow_3, logic_array_2_flow_2, logic_array_2_flow_3 portRadius=1000;

CHANNEL channel_flow_1_1 from logic_array_1_flow_1 2 to logic_array_1 1 channelWidth=200;
CHANNEL channel_flow_1_3 from logic_array_1_flow_3 2 to logic_array_1 3 channelWidth=200;
CHANNEL channel_mid_1 from logic_array_1 2 to logic_array_2 1 channelWidth=200;
CHANNEL channel_flow_2_2 from logic_array_2 2 to logic_array_2_flow_2 4 channelWidth=200;
CHANNEL channel_flow_2_3 from logic_array_2_flow_3 2 to logic_array_2 3 channelWidth=200;

END LAYER
LAYER CONTROL

H BANK logic_array_1_control_a of 10 PORT portRadius=1000 spacing=3000;
H BANK logic_array_1_control_b of 10 PORT portRadius=1000 spacing=3000;
PORT logic_array_1_control_24, logic_array_1_control_25, logic_array_1_control_26 portRadius=1000;

CHANNEL cc_1_a1 from logic_array_1_control_a 1 to logic_array_1 4 channelWidth=100;
CHANNEL cc_1_a2 from logic_array_1_control_a 2 to logic_array_1 5 channelWidth=100;
CHANNEL cc_1_a3 from logic_array_1_control_a 3 to logic_array_1 6 channelWidth=100;
CHANNEL cc_1_a4 from logic_array_1_control_a 4 to logic_array_1 7 channelWidth=100;
CHANNEL cc_1_a5 from logic_array_1_control_a 5 to logic_array_1 8 channelWidth=100;
CHANNEL cc_1_a6 from logic_array_1_control_a 6 to logic_array_1 9 channelWidth=100;
CHANNEL cc_1_a7 from logic_array_1_control_a 7 to logic_array_1 10 channelWidth=100;
CHANNEL cc_1_a8 from logic_array_1_control_a 8 to logic_array_1 11 channelWidth=100;
CHANNEL cc_1_a9 from logic_array_1_control_a 9 to logic_array_1 12 channelWidth=100;
CHANNEL cc_1_a10 from logic_array_1_control_a 10 to logic_array_1 13 channelWidth=100;
CHANNEL cc_1_b1 from logic_array_1_control_b 1 to logic_array_1 14 channelWidth=100;
CHANNEL cc_1_b2 from logic_array_1_control_b 2 to logic_array_1 15 channelWidth=100;
CHANNEL cc_1_b3 from logic_array_1_control_b 3 to logic_array_1 16 channelWidth=100;
CHANNEL cc_1_b4 from logic_array_1_control_b 4 to logic_array_1 17 channelWidth=100;
CHANNEL cc_1_b5 from logic_array_1_control_b 5 to logic_array_1 18 channelWidth=100;
CHANNEL cc_1_b6 from logic_array_1_control_b 6 to logic_array_1 19 channelWidth=100;
CHANNEL cc_1_b7 from logic_array_1_control_b 7 to logic_array_1 20 channelWidth=100;
CHANNEL cc_1_b8 from logic_array_1_control_b 8 to logic_array_1 21 channelWidth=100;
CHANNEL cc_1_b9 from logic_array_1_control_b 9 to logic_array_1 22 channelWidth=100;
CHANNEL cc_1_b10 from logic_array_1_control_b 10 to logic_array_1 23 channelWidth=100;
CHANNEL cc_1_24 from logic_array_1_control_24 3 to logic_array_1 24 channelWidth=100;
CHANNEL cc_1_25 from logic_array_1_control_25 3 to logic_array_1 25 channelWidth=100;
CHANNEL cc_1_26 from logic_array_1_control_26 1 to logic_array_1 26 channelWidth=100;

H BANK logic_array_2_control_a of 10 PORT portRadius=1000 spacing=3000;
H BANK logic_array_2_control_b of 10 PORT portRadius=1000 spacing=3000;
PORT logic_array_2_control_24, logic_array_2_control_25, logic_array_2_control_26 portRadius=1000;

CHANNEL cc_2_a1 from logic_array_2_control_a 1 to logic_array_2 4 channelWidth=100;
CHANNEL cc_2_a2 from logic_array_2_control_a 2 to logic_array_2 5 channelWidth=100;
CHANNEL cc_2_a3 from logic_array_2_control_a 3 to logic_array_2 6 channelWidth=100;
CHANNEL cc_2_a4 from logic_array_2_control_a 4 to logic_array_2 7 channelWidth=100;
CHANNEL cc_2_a5 from logic_array_2_control_a 5 to logic_array_2 8 channelWidth=100;
CHANNEL cc_2_a6 from logic_array_2_control_a 6 to logic_array_2 9 channelWidth=100;
CHANNEL cc_2_a7 from logic_array_2_control_a 7 to logic_array_2 10 channelWidth=100;
CHANNEL cc_2_a8 from logic_array_2_control_a 8 to logic_array_2 11 channelWidth=100;
CHANNEL cc_2_a9 from logic_array_2_control_a 9 to logic_array_2 12 channelWidth=100;
CHANNEL cc_2_a10 from logic_array_2_control_a 10 to logic_array_2 13 channelWidth=100;
CHANNEL cc_2_b1 from logic_array_2_control_b 1 to logic_array_2 14 channelWidth=100;
CHANNEL cc_2_b2 from logic_array_2_control_b 2 to logic_array_2 15 channelWidth=100;
CHANNEL cc_2_b3 from logic_array_2_control_b 3 to logic_array_2 16 channelWidth=100;
CHANNEL cc_2_b4 from logic_array_2_control_b 4 to logic_array_2 17 channelWidth=100;
CHANNEL cc_2_b5 from logic_array_2_control_b 5 to logic_array_2 18 channelWidth=100;
CHANNEL cc_2_b6 from logic_array_2_control_b 6 to logic_array_2 19 channelWidth=100;
CHANNEL cc_2_b7 from logic_array_2_control_b 7 to logic_array_2 20 channelWidth=100;
CHANNEL cc_2_b8 from logic_array_2_control_b 8 to logic_array_2 21 channelWidth=100;
CHANNEL cc_2_b9 from logic_array_2_control_b 9 to logic_array_2 22 channelWidth=100;
CHANNEL cc_2_b10 from logic_array_2_control_b 10 to logic_array_2 23 channelWidth=100;
CHANNEL cc_2_24 from logic_array_2_control_24 3 to logic_array_2 24 channelWidth=100;
CHANNEL cc_2_25 from logic_array_2_control_25 3 to logic_array_2 25 channelWidth=100;
CHANNEL cc_2_26 from logic_array_2_control_26 1 to logic_array_2 26 channelWidth=100;

END LAYER
