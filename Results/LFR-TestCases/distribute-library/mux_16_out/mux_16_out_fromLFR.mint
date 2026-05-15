DEVICE mux_16_out



LAYER FLOW 

PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_13 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_14 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_15 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_16 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_17 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



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

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_13 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_14 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_15 componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_16 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_1 on channel_3 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_2 on channel_14 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_3 on channel_11 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_4 on channel_6 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_5 on channel_15 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_6 on channel_1 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_7 on channel_4 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_8 on channel_7 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_9 on channel_12 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_10 on channel_9 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_11 on channel_8 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_12 on channel_10 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_13 on channel_13 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_14 on channel_2 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_15 on channel_5 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_7 from Cport_7 1 to valve_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_8 from Cport_8 1 to valve_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_9 from Cport_9 1 to valve_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_10 from Cport_10 1 to valve_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_11 from Cport_11 1 to valve_11 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_12 from Cport_12 1 to valve_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_13 from Cport_13 1 to valve_13 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_14 from Cport_14 1 to valve_14 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_15 from Cport_15 1 to valve_15 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

