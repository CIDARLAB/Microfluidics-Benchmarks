DEVICE mux_04_in



LAYER flow

PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_3 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_4 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_5 1 to port_2 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control

PORT cport_0componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_3componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_1 on channel_4componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_2 on channel_1componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_3 on channel_2componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_2 from cport_2 1 to valve_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_3 from cport_3 1 to valve_3 1 connectionSpacing=1000 channelWidth=400;

 

END layer

