DEVICE nine_to_one_mux



LAYER flow

PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_3 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_4 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_5 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from port_6 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_7 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_8 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_9 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from port_10 1 to port_2 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control

PORT cport_0componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_2componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_1 on channel_5componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_2 on channel_4componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_3 on channel_9componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_4 on channel_1componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_5 on channel_6componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_6 on channel_7componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_7 on channel_8componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_8 on channel_3componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_2 from cport_2 1 to valve_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_3 from cport_3 1 to valve_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_4 from cport_4 1 to valve_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_5 from cport_5 1 to valve_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_6 from cport_6 1 to valve_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_7 from cport_7 1 to valve_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_8 from cport_8 1 to valve_8 1 connectionSpacing=1000 channelWidth=400;

 

END layer

