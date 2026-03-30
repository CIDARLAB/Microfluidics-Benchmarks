// MINT-TestCases mirror for LFR-TestCases/ghissues/issue9.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE issue9

LAYER FLOW

PORT in;
PORT out;
PORT x9;
PORT x1;
PORT inlet;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from x9 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from x1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to inlet 1 channelWidth=200;

END LAYER
