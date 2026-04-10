# MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/olfactory.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE olfactory

LAYER FLOW

PORT stimulus;
PORT buffer;
PORT left_dye;
PORT right_dye;
PORT worm;
PORT left_outlet;
PORT c;
MIXER mixer_stub;

CHANNEL c0 from stimulus 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from buffer 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from left_dye 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from right_dye 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from worm 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from left_outlet 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c 1 channelWidth=200;

END LAYER
