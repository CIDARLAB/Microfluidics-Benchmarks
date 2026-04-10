# MINT-TestCases mirror for LFR-TestCases/Protocols/MARS/ligation.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE ligation

LAYER FLOW

PORT ligase_buffer;
PORT vector_dna;
PORT insert_dna;
PORT nfwater;
PORT ligase;
PORT result;
MIXER mixer_stub;

CHANNEL c0 from ligase_buffer 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from vector_dna 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from insert_dna 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from nfwater 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from ligase 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to result 1 channelWidth=200;

END LAYER
