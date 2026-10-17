DEVICE Mfd_005_Chip



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_3 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
MIXER mixer_1 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
MIXER mixer_2 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from square_cell_trap_1 2 to reaction_chamber_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from reaction_chamber_1 3 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from reaction_chamber_3 3 to reaction_chamber_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from reaction_chamber_2 3 to square_cell_trap_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from mixer_1 2 to reaction_chamber_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from mixer_2 2 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from port_4 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from port_5 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from mixer_3 2 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from port_3 1 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_11 from port_2 1 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

