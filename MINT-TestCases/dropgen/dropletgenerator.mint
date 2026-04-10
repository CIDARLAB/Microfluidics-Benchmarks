# MINT-TestCases mirror for LFR-TestCases/dropgen/dropletgenerator.lfr
# Source: hand-authored template

DEVICE dropletgenerator

LAYER FLOW

PORT waterin portRadius=1500;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1;
PORT dropletout portRadius=1500;

CHANNEL channel_1 from waterin 1 to nozzle_droplet_generator_1 2 channelWidth=300;
CHANNEL channel_2 from nozzle_droplet_generator_1 1 to dropletout 1 channelWidth=300;

END LAYER
