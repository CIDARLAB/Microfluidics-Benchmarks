// MINT-TestCases mirror for LFR-TestCases/distribute-library/cell_traps_4.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE cell_traps_4

LAYER FLOW

PORT in1;
MIXER mixer_stub;

CHANNEL c0 from in1 1 to mixer_stub 1 channelWidth=200;

END LAYER
