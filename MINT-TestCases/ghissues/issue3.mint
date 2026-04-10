# MINT-TestCases mirror for LFR-TestCases/ghissues/issue3.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE design3

LAYER FLOW

PORT in;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END LAYER
