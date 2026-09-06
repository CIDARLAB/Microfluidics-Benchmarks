DEVICE import_droplet_reaction



LAYER FLOW 

NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 rotation=90.0 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from nozzle_droplet_generator_1 2 to reaction_chamber_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from reaction_chamber_1 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from mixer_1 2 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from mixer_2 2 to nozzle_droplet_generator_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_5 from port_2 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_6 from port_3 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_7 from port_4 1 to nozzle_droplet_generator_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_8 from port_5 1 to nozzle_droplet_generator_1 3 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_9 from port_6 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_1 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_2 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;

 

END LAYER

