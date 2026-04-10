# MINT-TestCases mirror for LFR-TestCases/Transport Networks/one_to_one.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE one_to_one

LAYER FLOW

PORT in;
PORT out;
PORT c1;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c1 1 channelWidth=200;

END LAYER
