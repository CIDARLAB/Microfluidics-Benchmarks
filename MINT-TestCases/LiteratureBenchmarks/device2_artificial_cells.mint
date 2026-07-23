DEVICE device2_artificial_cells



LAYER FLOW 

MIXER mixer_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
MIXER mixer_2 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
MIXER mixer_3 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
MIXER mixer_4 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
MIXER mixer_5 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
MIXER mixer_6 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
MIXER mixer_7 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;
MIXER mixer_8 componentSpacing=9000 ;
PORT port_8 componentSpacing=9000 ;
PORT port_9 componentSpacing=9000 ;
PORT port_10 componentSpacing=9000 ;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from mixer_2 2 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from mixer_3 2 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from mixer_4 2 to port_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from mixer_5 2 to port_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from mixer_6 2 to port_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from mixer_7 2 to port_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from mixer_8 2 to port_8 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 







 

END LAYER

