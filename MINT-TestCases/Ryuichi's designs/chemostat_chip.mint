# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/chemostat_chip.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE chemostat_chip

LAYER FLOW

PORT in;
PORT out;
PORT c1;
PORT c2;
PORT c3;
PORT c4;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from c1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from c2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from c3 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c4 1 channelWidth=200;

END LAYER
