# MINT-TestCases mirror for LFR-TestCases/Protocols/MARS/transformation.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE transformation

LAYER FLOW

PORT plasmid;
PORT cell_suspension;
PORT result;
MIXER mixer_stub;

CHANNEL c0 from plasmid 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from cell_suspension 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to result 1 channelWidth=200;

END LAYER
