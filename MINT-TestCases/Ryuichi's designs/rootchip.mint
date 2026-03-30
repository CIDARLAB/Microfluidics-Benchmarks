// MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/rootchip.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE rootchip

LAYER FLOW

PORT flow_in;
PORT plant;
PORT c;
MIXER mixer_stub;

CHANNEL c0 from flow_in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from plant 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c 1 channelWidth=200;

END LAYER
