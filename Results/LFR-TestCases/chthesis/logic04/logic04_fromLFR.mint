DEVICE logic04



LAYER FLOW 

YTREE ytree_1 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;



CHANNEL channel_1 from ytree_1 5 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from ytree_1 5 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from ytree_1 5 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from ytree_1 5 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from ytree_1 5 to port_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from ytree_1 5 to port_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from mixer_5 2 to mixer_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from mixer_7 2 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_10 from mixer_7 2 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_11 from mixer_7 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_12 from mixer_7 2 to square_cell_trap_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_13 from mixer_3 2 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_14 from mixer_4 2 to mixer_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_15 from mixer_2 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_16 from mixer_6 2 to mixer_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_17 from port_6 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_18 from port_7 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_19 from port_8 1 to mixer_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_20 from port_9 1 to mixer_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_21 from port_10 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_22 from port_11 1 to mixer_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_23 from port_12 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_24 from port_1 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_25 from port_1 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_26 from port_1 1 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_27 from port_1 1 to port_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_28 from port_1 1 to port_5 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

