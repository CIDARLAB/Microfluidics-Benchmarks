// MINT-TestCases mirror for LFR-TestCases/mars/ligation.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE ligation

LAYER FLOW

PORT B;
PORT C;
PORT D;
PORT E;
PORT F;
PORT g_out;
PORT c1;
PORT c2;
MIXER mixer_stub;

CHANNEL c0 from B 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from C 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from D 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from E 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from F 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from g_out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from c1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c2 1 channelWidth=200;

END LAYER
