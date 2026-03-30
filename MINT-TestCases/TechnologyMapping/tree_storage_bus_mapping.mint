// MINT-TestCases mirror for LFR-TestCases/TechnologyMapping/tree_storage_bus_mapping.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE tree_storage_bus_mapping

LAYER FLOW

PORT input;
PORT output;
MIXER mixer_stub;

CHANNEL c0 from input 1 to mixer_stub 1 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to output 1 channelWidth=200;

END LAYER
