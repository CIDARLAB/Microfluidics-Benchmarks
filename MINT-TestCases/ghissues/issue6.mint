# MINT-TestCases mirror for LFR-TestCases/ghissues/issue6.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE samv0

LAYER FLOW

PORT bank_in1;
PORT bank_in2;
PORT wash;
PORT out1;
PORT out2;
PORT mux_c1;
PORT mux_c2;
PORT cell_c;
PORT wash_c;
MIXER mixer_stub;

CHANNEL c0 from bank_in1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from bank_in2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from wash 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from out1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from out2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from mux_c1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from mux_c2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from cell_c 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to wash_c 1 channelWidth=200;

END LAYER
