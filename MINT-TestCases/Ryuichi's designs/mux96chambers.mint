# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/mux96chambers.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE mux96chambers

LAYER FLOW

PORT in;
PORT waste;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to waste 1 channelWidth=200;

END LAYER
