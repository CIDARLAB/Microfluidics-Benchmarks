# MINT-TestCases mirror for LFR-TestCases/mars/transformation.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE transformation

LAYER flow

PORT b;
PORT c;
PORT d_out;
MIXER mixer_stub;

CHANNEL c0 from b 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from c 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to d_out 1 channelWidth=200;

END layer
