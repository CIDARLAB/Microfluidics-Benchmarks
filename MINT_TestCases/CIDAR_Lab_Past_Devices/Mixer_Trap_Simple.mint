DEVICE Mixer_Trap_Simple
LAYER FLOW

PORT port_in portRadius=1000;
MIXER mixer_1 numberOfBends=6 bendSpacing=200 bendLength=800 channelWidth=400;
CELL TRAPPER cell_trapper_1 chamberWidth=400 chamberLength=400 channelWidth=400 channelLength=2000;
PORT port_out portRadius=1000;

CHANNEL channel_1 from port_in 2 to mixer_1 1 channelWidth=400;
CHANNEL channel_2 from mixer_1 2 to cell_trapper_1 1 channelWidth=400;
CHANNEL channel_3 from cell_trapper_1 2 to port_out 4 channelWidth=400;

END LAYER
