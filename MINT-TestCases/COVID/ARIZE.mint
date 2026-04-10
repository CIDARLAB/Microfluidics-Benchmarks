# MINT-TestCases mirror for LFR-TestCases/COVID/ARIZE.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE expression1

LAYER FLOW

PORT in1a;
PORT in2a;
PORT in3a;
PORT in4a;
PORT in5a;
PORT in6a;
PORT in7a;
PORT in1b;
PORT in2b;
PORT in3b;
PORT in4b;
PORT in5b;
PORT in6b;
PORT in7b;
PORT in8b;
PORT in9b;
PORT out1;
PORT out2;
MIXER mixer_stub;

CHANNEL c0 from in1a 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from in2a 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from in3a 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from in4a 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from in5a 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from in6a 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from in7a 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from in1b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c8 from in2b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c9 from in3b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c10 from in4b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c11 from in5b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c12 from in6b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c13 from in7b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c14 from in8b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c15 from in9b 1 to mixer_stub 2 channelWidth=200;
CHANNEL c16 from out1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out2 1 channelWidth=200;

END LAYER
