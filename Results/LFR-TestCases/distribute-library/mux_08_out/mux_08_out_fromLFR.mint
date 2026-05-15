DEVICE mux_08_out



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



CHANNEL channel_1 from port_6 1 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_6 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_6 1 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_6 1 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from port_6 1 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_6 1 to port_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_6 1 to port_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_6 1 to port_9 1 connectionSpacing=1000 channelWidth=400;

 

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

VALVE3D valve_0 on channel_3 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_1 on channel_1 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_2 on channel_4 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_3 on channel_6 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_4 on channel_2 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_5 on channel_5 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_6 on channel_8 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_7 on channel_7 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_7 from Cport_7 1 to valve_7 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

