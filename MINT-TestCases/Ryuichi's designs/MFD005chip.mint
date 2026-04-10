# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/MFD005chip.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE MFD005chip

LAYER FLOW

PORT Inlet1;
PORT Inlet2;
PORT port;
PORT outlet;
PORT waste;
MIXER mixer_stub;

CHANNEL c0 from Inlet1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from Inlet2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from port 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from outlet 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to waste 1 channelWidth=200;

END LAYER
