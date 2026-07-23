DEVICE dropletgenerator3



LAYER FLOW 

PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_4 1 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_8 1 to port_2 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

