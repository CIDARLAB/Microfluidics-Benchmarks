DEVICE droplet_generator



LAYER FLOW 

NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 rotation=90.0 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from nozzle_droplet_generator_1 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from port_3 1 to nozzle_droplet_generator_1 3 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from port_4 1 to nozzle_droplet_generator_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

