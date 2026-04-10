# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/seeding.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE seeding

LAYER FLOW

PORT c;
PORT buffer;
PORT stimuli;
PORT seeding_out;
PORT waste;
MIXER mixer_stub;

CHANNEL c0 from c 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from buffer 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from stimuli 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from seeding_out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to waste 1 channelWidth=200;

END LAYER
