# MINT-TestCases mirror for LFR-TestCases/Expressions/expression1.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE expression1

LAYER FLOW

PORT in1;
PORT in2;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from in1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from in2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END LAYER
