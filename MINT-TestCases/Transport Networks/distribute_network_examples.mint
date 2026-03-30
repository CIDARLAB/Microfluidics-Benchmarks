// MINT-TestCases mirror for LFR-TestCases/Transport Networks/distribute_network_examples.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE one_to_n

LAYER FLOW

PORT in;
PORT out;
PORT c1;
PORT c2;
PORT begin;
PORT out;
PORT in;
PORT c2;
PORT c2;
MIXER mixer_stub;

CHANNEL c0 from in 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from c1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from c2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from begin 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from in 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from c2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c2 1 channelWidth=200;

END LAYER
