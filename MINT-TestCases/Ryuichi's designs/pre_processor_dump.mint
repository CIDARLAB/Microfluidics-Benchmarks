// MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/pre_processor_dump.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE seeding

LAYER FLOW

PORT c0;
PORT c1;
PORT c2;
PORT c3;
PORT c4;
PORT c5;
PORT c6;
PORT seeding0;
PORT seeding1;
PORT buffer;
PORT stimuli;
PORT waste;
MIXER mixer_stub;

CHANNEL c0 from c0 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from c1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from c2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from c3 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from c4 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from c5 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from c6 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from seeding0 1 to mixer_stub 2 channelWidth=200;
CHANNEL c8 from seeding1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c9 from buffer 1 to mixer_stub 2 channelWidth=200;
CHANNEL c10 from stimuli 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to waste 1 channelWidth=200;

END LAYER
