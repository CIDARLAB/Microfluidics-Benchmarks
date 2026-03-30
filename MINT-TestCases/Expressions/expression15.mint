// MINT-TestCases mirror for LFR-TestCases/Expressions/expression15.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE expression15

LAYER FLOW

PORT f1;
PORT f2;
PORT f3;
PORT f4;
PORT f5;
PORT f6;
PORT fout;
MIXER mixer_stub;

CHANNEL c0 from f1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from f2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from f3 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from f4 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from f5 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from f6 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to fout 1 channelWidth=200;

END LAYER
