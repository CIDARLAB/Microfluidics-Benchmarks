// Handwritten MINT twin of multi_mixer.lfr.
// Three MIXER instances, each numberOfBends=1, joined by CHANNEL.
// That is three separate serpentine bodies with pipes between them.
// Contrast with long_mixer.mint: one mixer, numberOfBends=3, no inter-mixer pipe.
//
// Keepout / stub length match LFR compile: MIXER keepout 1000, PORT keepout
// 2000 (latest default), CHANNEL length=minChannelLength=1000.

DEVICE multi_mixer

LAYER FLOW

MIXER mixer_1 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

CHANNEL channel_1 from mixer_1 2 to port_1 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;
CHANNEL channel_2 from mixer_2 2 to mixer_1 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;
CHANNEL channel_3 from mixer_3 2 to mixer_2 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;
CHANNEL channel_4 from port_2 1 to mixer_3 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;
CHANNEL channel_5 from port_3 1 to mixer_3 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;

END LAYER
