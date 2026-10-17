DEVICE Droplet_Generator_1



LAYER FLOW 

NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=2000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from nozzle_droplet_generator_1 3 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

