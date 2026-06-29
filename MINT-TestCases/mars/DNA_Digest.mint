# MINT-TestCases mirror for LFR-TestCases/mars/DNA_Digest.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE dna_digest

LAYER flow

PORT b;
PORT c;
PORT d;
PORT a_out;
PORT c_val;
MIXER mixer_stub;

CHANNEL c0 from b 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from c 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from d 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from a_out 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c_val 1 channelWidth=200;

END layer
