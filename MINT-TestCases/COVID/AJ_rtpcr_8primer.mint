// MINT-TestCases mirror for LFR-TestCases/COVID/AJ_rtpcr_8primer.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE aj_rtpcr2

LAYER FLOW

PORT primerin;
PORT pcrmix;
PORT rtmix;
PORT amplifiedout;
PORT cprimer;
MIXER mixer_stub;

CHANNEL c0 from primerin 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from pcrmix 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from rtmix 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from amplifiedout 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to cprimer 1 channelWidth=200;

END LAYER
