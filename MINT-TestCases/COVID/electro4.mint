// MINT-TestCases mirror for LFR-TestCases/COVID/electro4.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE electro4

LAYER FLOW

PORT dna_line;
PORT denaturing_line;
PORT probe_line;
PORT gelin;
PORT exit;
PORT gelout;
MIXER mixer_stub;

CHANNEL c0 from dna_line 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from denaturing_line 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from probe_line 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from gelin 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from exit 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to gelout 1 channelWidth=200;

END LAYER
