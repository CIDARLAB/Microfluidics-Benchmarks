DEVICE expression13



LAYER FLOW 

DROPLET SPLITTER droplet_splitter_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;



CHANNEL channel_1 from droplet_splitter_1 3 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from droplet_splitter_1 3 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from port_3 1 to droplet_splitter_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

