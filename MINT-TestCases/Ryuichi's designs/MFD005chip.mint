# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/MFD005chip.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE mfd005chip

LAYER flow

PORT inlet1;
PORT inlet2;
PORT port;
PORT outlet;
PORT waste;
MIXER mixer_stub;

CHANNEL c0 from inlet1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from inlet2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from port 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from outlet 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to waste 1 channelWidth=200;

END layer
