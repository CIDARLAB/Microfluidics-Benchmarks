# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/incubator.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE incubator

LAYER flow

PORT a;
PORT b;
PORT c;
PORT d;
PORT e;
PORT x;
PORT y;
PORT z;
PORT valve;
MIXER mixer_stub;

CHANNEL c0 from a 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from c 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from d 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from e 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from x 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from y 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from z 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to valve 1 channelWidth=200;

END layer
