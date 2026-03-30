// MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/incubator.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE incubator

LAYER FLOW

PORT A;
PORT B;
PORT C;
PORT D;
PORT E;
PORT X;
PORT Y;
PORT Z;
PORT valve;
MIXER mixer_stub;

CHANNEL c0 from A 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from B 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from C 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from D 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from E 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from X 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from Y 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from Z 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to valve 1 channelWidth=200;

END LAYER
