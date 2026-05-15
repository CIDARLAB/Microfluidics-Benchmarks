DEVICE aj_rtpcr2



LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_8 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_9 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_13 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_14 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_15 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_16 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_17 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_18 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_19 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_20 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
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

 

END LAYER

LAYER CONTROL 

PORT Cport_32 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_33 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_34 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_35 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_36 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_37 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_38 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_39 componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_32 on channel_9 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_33 on channel_8 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_34 on channel_6 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_35 on channel_5 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_36 on channel_4 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_37 on channel_7 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_38 on channel_11 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_39 on channel_10 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_32 from Cport_32 1 to valve_32 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_33 from Cport_33 1 to valve_33 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_34 from Cport_34 1 to valve_34 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_35 from Cport_35 1 to valve_35 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_36 from Cport_36 1 to valve_36 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_37 from Cport_37 1 to valve_37 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_38 from Cport_38 1 to valve_38 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_39 from Cport_39 1 to valve_39 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

