DEVICE single_storage_grid_08



LAYER flow

PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_2 1 to port_1 1 connectionSpacing=1000 channelWidth=400;

 

END layer

