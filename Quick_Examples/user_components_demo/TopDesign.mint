DEVICE topdesign

LAYER flow
PORT in_acomponentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT in_bcomponentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT out_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MYGADGET gadget_1componentSpacing=1000.0;
CHANNEL ch_in_a from in_a 1 to gadget_1 1 connectionSpacing=1600 channelWidth=800 height=250;
CHANNEL ch_in_b from in_b 1 to gadget_1 2 connectionSpacing=1600 channelWidth=800 height=250;
CHANNEL ch_out from gadget_1 3 to out_1 1 connectionSpacing=1600 channelWidth=800 height=250;
END layer
