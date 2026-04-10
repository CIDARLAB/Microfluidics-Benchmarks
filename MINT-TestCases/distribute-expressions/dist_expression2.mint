# MINT-TestCases mirror for LFR-TestCases/distribute-expressions/dist_expression2.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE dist_expression2

LAYER FLOW

PORT in;
PORT out1;
PORT out2;
PORT c1;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from out2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c1 1 channelWidth=200;

END LAYER
