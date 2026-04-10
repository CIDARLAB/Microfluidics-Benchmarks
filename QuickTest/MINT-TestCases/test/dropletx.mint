# MINT-TestCases mirror for LFR-TestCases/dropletx.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE dropletx

LAYER FLOW

PORT analyte;
PORT reagent1;
PORT reagent2;
MIXER mixer_stub;

CHANNEL c0 from analyte 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from reagent1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to reagent2 1 channelWidth=200;

END LAYER
