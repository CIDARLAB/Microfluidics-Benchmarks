DEVICE flow_focus

LAYER flow

PORT pportRadius=100;
V DROPLET GENERATOR FLOW FOCUS ffradius=100 oilChannelWidth=100 waterChannelWidth=40 angle=30 length=500;
NODE n1, n2;

CHANNEL c1 from ff 1 to n1 channelWidth=100;
CHANNEL c2 from n1 to n2channelWidth=20;
CHANNEL c3 from n2 to p 1channelWidth=100;

END layer

