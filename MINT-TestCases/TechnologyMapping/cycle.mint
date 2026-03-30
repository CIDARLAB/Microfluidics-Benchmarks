// MINT-TestCases mirror for LFR-TestCases/TechnologyMapping/cycle.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE cycle

LAYER FLOW

PORT input1;
PORT input2;
PORT input3;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from input1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from input2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from input3 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END LAYER
