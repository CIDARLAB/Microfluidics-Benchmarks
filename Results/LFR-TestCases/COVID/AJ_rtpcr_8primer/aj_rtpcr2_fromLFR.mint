DEVICE aj_rtpcr2



LAYER flow

PORT port_1portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_3componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_4componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_5componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_6componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_7componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_8componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_9componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_10componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_11componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_12componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_13componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_14componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_15componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_16componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_17componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_18componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_19componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_20componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from mixer_2 2 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from mixer_3 2 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from mixer_4 2 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from mixer_5 2 to port_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from mixer_6 2 to port_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from mixer_7 2 to port_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from mixer_8 2 to port_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from mixer_9 2 to port_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from port_11 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from port_12 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_13 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_14 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from port_15 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_17 from port_16 1 to mixer_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_18 from port_17 1 to mixer_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_19 from port_18 1 to mixer_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_20 from port_19 1 to mixer_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_21 from port_20 1 to mixer_7 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control

PORT cport_32componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_33componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_34componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_35componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_36componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_37componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_38componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_39componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_32 on channel_9componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_33 on channel_8componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_34 on channel_6componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_35 on channel_5componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_36 on channel_4componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_37 on channel_7componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_38 on channel_11componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_39 on channel_10componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_32 from cport_32 1 to valve_32 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_33 from cport_33 1 to valve_33 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_34 from cport_34 1 to valve_34 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_35 from cport_35 1 to valve_35 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_36 from cport_36 1 to valve_36 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_37 from cport_37 1 to valve_37 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_38 from cport_38 1 to valve_38 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_39 from cport_39 1 to valve_39 1 connectionSpacing=1000 channelWidth=400;

 

END layer

