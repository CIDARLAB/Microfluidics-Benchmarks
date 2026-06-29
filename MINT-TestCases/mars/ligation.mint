# MINT-TestCases mirror for LFR-TestCases/mars/ligation.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE ligation

LAYER flow

PORT b;
PORT c;
PORT d;
PORT e;
PORT f;
PORT g_out;
PORT c1;
PORT c2;
MIXER mixer_stub;

CHANNEL c0 from b 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from c 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from d 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from e 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from f 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from g_out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from c1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c2 1 channelWidth=200;

END layer
