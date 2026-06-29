DEVICE mux_16_out



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
PORT port_11componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_12componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_13componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_14componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_15componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_16componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_17componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_15 1 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_15 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_15 1 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_15 1 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from port_15 1 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_15 1 to port_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_15 1 to port_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_15 1 to port_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from port_15 1 to port_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from port_15 1 to port_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from port_15 1 to port_11 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from port_15 1 to port_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from port_15 1 to port_13 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_15 1 to port_14 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_15 1 to port_16 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from port_15 1 to port_17 1 connectionSpacing=1000 channelWidth=400;

 

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
PORT cport_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_10componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_11componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_12componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_13componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_14componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_15componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_16componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_1 on channel_3componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_2 on channel_14componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_3 on channel_11componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_4 on channel_6componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_5 on channel_15componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_6 on channel_1componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_7 on channel_4componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_8 on channel_7componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_9 on channel_12componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_10 on channel_9componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_11 on channel_8componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_12 on channel_10componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_13 on channel_13componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_14 on channel_2componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_15 on channel_5componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_2 from cport_2 1 to valve_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_3 from cport_3 1 to valve_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_4 from cport_4 1 to valve_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_5 from cport_5 1 to valve_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_6 from cport_6 1 to valve_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_7 from cport_7 1 to valve_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_8 from cport_8 1 to valve_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_9 from cport_9 1 to valve_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_10 from cport_10 1 to valve_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_11 from cport_11 1 to valve_11 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_12 from cport_12 1 to valve_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_13 from cport_13 1 to valve_13 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_14 from cport_14 1 to valve_14 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_15 from cport_15 1 to valve_15 1 connectionSpacing=1000 channelWidth=400;

 

END layer

