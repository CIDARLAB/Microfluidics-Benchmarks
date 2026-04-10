# MINT-TestCases mirror for LFR-TestCases/dropgen/dropletgenerator4.lfr
# Source: hand-authored template

DEVICE dropletgenerator4

LAYER FLOW

PORT oilin1 portRadius=1200;
PORT oilin2 portRadius=1200;
PORT waterin1 portRadius=1200;
PORT waterin2 portRadius=1200;
PORT dropletout1 portRadius=1200;
PORT dropletout2 portRadius=1200;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2;

CHANNEL c1 from oilin1 1 to nozzle_droplet_generator_1 2 channelWidth=280;
CHANNEL c2 from oilin2 1 to nozzle_droplet_generator_1 4 channelWidth=280;
CHANNEL c3 from waterin1 1 to nozzle_droplet_generator_1 6 channelWidth=280;
CHANNEL c4 from oilin1 1 to nozzle_droplet_generator_2 2 channelWidth=280;
CHANNEL c5 from oilin2 1 to nozzle_droplet_generator_2 4 channelWidth=280;
CHANNEL c6 from waterin2 1 to nozzle_droplet_generator_2 6 channelWidth=280;
CHANNEL c7 from nozzle_droplet_generator_1 1 to dropletout1 1 channelWidth=280;
CHANNEL c8 from nozzle_droplet_generator_2 1 to dropletout2 1 channelWidth=280;

END LAYER
