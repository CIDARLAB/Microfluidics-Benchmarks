// MINT-TestCases mirror for LFR-TestCases/GraphCoverage/n_l_m_map.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE n_l_m_map

LAYER FLOW

PORT i1;
PORT out;
MIXER mixer_stub;

CHANNEL c0 from i1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to out 1 channelWidth=200;

END LAYER
