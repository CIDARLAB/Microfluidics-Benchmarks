// MINT-TestCases mirror for LFR-TestCases/mars/transformation.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE transformation

LAYER FLOW

PORT B;
PORT C;
PORT d_out;
MIXER mixer_stub;

CHANNEL c0 from B 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from C 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to d_out 1 channelWidth=200;

END LAYER
