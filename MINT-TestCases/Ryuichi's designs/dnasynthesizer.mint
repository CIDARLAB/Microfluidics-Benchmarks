# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/dnasynthesizer.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE dnasynthesizer

LAYER FLOW

PORT in;
PORT out;
PORT c;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c 1 channelWidth=200;

END LAYER
