DEVICE Issue_3



LAYER FLOW 

MIXER mixer_1 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
MIXER mixer_4 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_5 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_6 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
MIXER mixer_6 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_7 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_8 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_9 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_7 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
MIXER mixer_10 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_11 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_12 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_8 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from mixer_2 2 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_4 1 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from mixer_1 2 to port_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from mixer_4 2 to mixer_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from mixer_6 2 to mixer_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from port_3 1 to mixer_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from mixer_7 2 to mixer_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from port_1 1 to mixer_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from port_2 1 to mixer_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from mixer_3 2 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_11 from port_3 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_12 from mixer_5 2 to port_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_13 from port_4 1 to mixer_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_14 from port_1 1 to mixer_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_15 from port_2 1 to mixer_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_16 from mixer_11 2 to mixer_10 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_17 from mixer_10 2 to port_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_18 from port_4 1 to mixer_10 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_19 from mixer_12 2 to mixer_11 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_20 from port_3 1 to mixer_11 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_21 from port_1 1 to mixer_12 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_22 from port_2 1 to mixer_12 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_23 from port_1 1 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_24 from port_2 1 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_25 from mixer_8 2 to mixer_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_26 from port_3 1 to mixer_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_27 from mixer_9 2 to port_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_28 from port_4 1 to mixer_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

