# MINT-TestCases mirror for LFR-TestCases/Expressions/expression13.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE expression13

LAYER FLOW

PORT in1;
PORT out1;
PORT out2;
MIXER mixer_stub;

CHANNEL c0 from in1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out2 1 channelWidth=200;

END LAYER
