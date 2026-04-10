# MINT-TestCases mirror for LFR-TestCases/distribute-library/transposer_02.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE transposer_02

LAYER FLOW

PORT inputs;
PORT outputs;
PORT c_select;
MIXER mixer_stub;

CHANNEL c0 from inputs 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from outputs 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c_select 1 channelWidth=200;

END LAYER
