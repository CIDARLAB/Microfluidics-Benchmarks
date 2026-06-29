# MINT-TestCases mirror for LFR-TestCases/dropx/dropx_test4.lfr
# Source: hand-authored template

DEVICE dropx_test4

LAYER flow

PORT port_1portRadius=2000;
PORT port_2portRadius=2000;
PORT port_3portRadius=2000;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1;
MIXER mixer_1;

CHANNEL channel_1 from port_1 to nozzle_droplet_generator_1 2channelWidth=400;
CHANNEL channel_2 from nozzle_droplet_generator_1 1 to mixer_1 1 channelWidth=400;
CHANNEL channel_3 from port_2 to mixer_1 2channelWidth=400;
CHANNEL channel_4 from mixer_1 3 to port_3 1 channelWidth=400;

END layer
