// MINT-TestCases mirror for LFR-TestCases/Protocols/MARS/fluorescence.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE fluorescence

LAYER FLOW

PORT toehold;
PORT trigger_rna;
PORT mastermix;
MIXER mixer_stub;

CHANNEL c0 from toehold 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from trigger_rna 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to mastermix 1 channelWidth=200;

END LAYER
