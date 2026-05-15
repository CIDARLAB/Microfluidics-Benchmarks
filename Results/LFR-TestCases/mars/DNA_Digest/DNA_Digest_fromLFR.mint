# Please add default length and width to reaction chamber component
DEVICE DNA_Digest



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_3 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_4 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_5 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_6 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_7 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_3 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_2  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_3  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from port_4  to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_4 from port_5  to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_5 from port_6  to nozzle_droplet_generator_3 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_6 from port_7  to nozzle_droplet_generator_3 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_7 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from nozzle_droplet_generator_2 3 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from nozzle_droplet_generator_3 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from mixer_2 2 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from port_8 1 to nozzle_droplet_generator_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_9 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_10 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_7 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

