DEVICE one_to_one



LAYER flow

PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_2 1 to port_1 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control

PORT cport_0componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_1componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;

 

END layer

