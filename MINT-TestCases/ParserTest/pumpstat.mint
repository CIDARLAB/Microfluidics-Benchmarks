// MINT-TestCases mirror for LFR-TestCases/ParserTest/pumpstat.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE pumpstat

LAYER FLOW

PORT in_1;
PORT out_1;
MIXER mixer_stub;

CHANNEL c0 from in_1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out_1 1 channelWidth=200;

END LAYER
