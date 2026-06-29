# MINT-TestCases mirror for LFR-TestCases/ghissues/issue7.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE gradient

LAYER flow

PORT p;
PORT q;
PORT e;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from p 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from q 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from e 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END layer
