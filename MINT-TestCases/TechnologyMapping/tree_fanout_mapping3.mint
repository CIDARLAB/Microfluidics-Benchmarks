# MINT-TestCases mirror for LFR-TestCases/TechnologyMapping/tree_fanout_mapping3.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE tree_fanout3

LAYER FLOW

PORT i1;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from i1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END LAYER
