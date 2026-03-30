// MINT-TestCases mirror for LFR-TestCases/Protocols/MARS/cell_sorting.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE cell_sorting

LAYER FLOW

PORT cell_suspension;
PORT plasma;
PORT cells;
MIXER mixer_stub;

CHANNEL c0 from cell_suspension 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from plasma 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to cells 1 channelWidth=200;

END LAYER
