// MINT-TestCases mirror for LFR-TestCases/Protocols/MARS/dna_digest.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE dna_digest

LAYER FLOW

PORT dna_suspension;
PORT buffer_enzyme_solution;
PORT water;
MIXER mixer_stub;

CHANNEL c0 from dna_suspension 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from buffer_enzyme_solution 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to water 1 channelWidth=200;

END LAYER
