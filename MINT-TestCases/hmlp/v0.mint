// MINT-TestCases mirror for LFR-TestCases/hmlp/v0.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE v0

LAYER FLOW

PORT inputs1;
PORT inputs2;
PORT wash;
PORT media;
PORT cells;
PORT outputs;
PORT c_inputs1;
PORT c_inputs2;
PORT c_wash;
PORT c_media;
MIXER mixer_stub;

CHANNEL c0 from inputs1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from inputs2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from wash 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from media 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from cells 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from outputs 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from c_inputs1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from c_inputs2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c8 from c_wash 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c_media 1 channelWidth=200;

END LAYER
