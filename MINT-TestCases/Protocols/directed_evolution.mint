# MINT-TestCases mirror for LFR-TestCases/Protocols/directed_evolution.lfr
# Source: minimal stub from module port list; fluigi emitted no variant

DEVICE directed_evolution

LAYER FLOW

PORT genes;
PORT pcr_mastermix;
PORT tx_tl_sol;
PORT ethanol;
PORT result;
PORT waste1;
PORT waste2;
PORT initial;
PORT found_candidate;
PORT found_result;
MIXER mixer_stub;

CHANNEL c0 from genes 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from pcr_mastermix 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from tx_tl_sol 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from ethanol 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from result 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from waste1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from waste2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from initial 1 to mixer_stub 2 channelWidth=200;
CHANNEL c8 from found_candidate 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to found_result 1 channelWidth=200;

END LAYER
