DEVICE dropletgenerator3



LAYER flow

PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_4 1 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_8 1 to port_2 1 connectionSpacing=1000 channelWidth=400;

 

END layer

