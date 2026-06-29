DEVICE cell_sorting



LAYER flow

PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_2 1 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_2 1 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_2 1 to port_4 1 connectionSpacing=1000 channelWidth=400;

 

END layer

