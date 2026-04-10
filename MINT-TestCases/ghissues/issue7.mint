# MINT-TestCases mirror for LFR-TestCases/ghissues/issue7.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE gradient

LAYER FLOW

PORT P;
PORT Q;
PORT E;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from P 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from Q 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from E 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END LAYER
