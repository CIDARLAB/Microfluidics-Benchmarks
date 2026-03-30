// MINT-TestCases mirror for LFR-TestCases/Ryuichi's designs/microdroplet.lfr
// Source: minimal stub from module port list; fluigi emitted no variant

DEVICE microdroplet

LAYER FLOW

PORT oil_inlet1;
PORT oil_inlet2;
PORT aqueous_inlet_1;
PORT aqueous_inlet_2;
PORT reservoir_inlet_1;
PORT reservoir_inlet_2;
PORT reservoir_outlet_1;
PORT reservoir_outlet_2;
PORT waste_outlet;
PORT c;
MIXER mixer_stub;

CHANNEL c0 from oil_inlet1 1 to mixer_stub 1 channelWidth=200;
CHANNEL c1 from oil_inlet2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c2 from aqueous_inlet_1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c3 from aqueous_inlet_2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c4 from reservoir_inlet_1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c5 from reservoir_inlet_2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c6 from reservoir_outlet_1 1 to mixer_stub 2 channelWidth=200;
CHANNEL c7 from reservoir_outlet_2 1 to mixer_stub 2 channelWidth=200;
CHANNEL c8 from waste_outlet 1 to mixer_stub 2 channelWidth=200;
CHANNEL c_out from mixer_stub 3 to c 1 channelWidth=200;

END LAYER
