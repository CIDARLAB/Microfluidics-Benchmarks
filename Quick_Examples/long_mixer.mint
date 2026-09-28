// Handwritten MINT twin of long_mixer.lfr.
// One MIXER, numberOfBends=3 — a single longer serpentine, not three bodies.
// Open this next to multi_mixer.mint: that file has three numberOfBends=1
// mixers with CHANNEL between them.
//
// Keepout / stub length match LFR compile: MIXER keepout 1000, PORT keepout
// 2000 (latest default), CHANNEL length=minChannelLength=1000.
// Envelope with library defaults (channelWidth=600, bendSpacing=1400,
// bendLength=2000): n=1 is 3200 x 4600; n=3 is 3200 x 12600.

DEVICE long_mixer

LAYER FLOW

MIXER mixer_1 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=3.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

CHANNEL channel_1 from mixer_1 2 to port_1 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;
CHANNEL channel_2 from port_2 1 to mixer_1 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;
CHANNEL channel_3 from port_3 1 to mixer_1 1 RoundedChannel=1 connectionSpacing=1000 channelWidth=600 length=1000 minChannelLength=1000 ;

END LAYER
