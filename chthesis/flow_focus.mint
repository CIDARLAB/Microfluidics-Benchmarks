DEVICE flow_focus

LAYER FLOW

PORT p_in, p_oil_1, p_oil_2, p_out r=100;
V DROPLET GENERATOR ff radius=100 oilChannelWidth=100 waterChannelWidth=40 angle=30;
NODE n1;
NODE n2;
CHANNEL c_in from p_in to ff 1 channelWidth=100;
CHANNEL c_oil_1_in from p_oil_1 to ff 2 channelWidth=100;
CHANNEL c_oil_2_in from p_oil_2 to ff 4 channelWidth=100;
CHANNEL c_out from ff 3 to n1 channelWidth=100;
CHANNEL c2 from n1 to n2 channelWidth=20;
CHANNEL c3 from n2 to p_out channelWidth=100;

END LAYER

