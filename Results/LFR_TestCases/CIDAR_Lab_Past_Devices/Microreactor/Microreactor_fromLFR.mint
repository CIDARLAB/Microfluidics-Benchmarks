DEVICE Microreactor





// === PORT COUNT CORRECTION ===
// Physical port counts in this file are authoritative for the synthesized device.
// FLOW ports: 2 (LFR module IO declared 2)
// CONTROL ports (Cport_*): 0 (LFR control bit width declared 10)
// Port counts differ from the original LFR IO / control bit-width.
// The physical counts above are authoritative. Common causes include
// MUX/distribute one-hot valves, metering nozzles, droplet sorters, and other mapped primitives:
//   - CONTROL port count differs from LFR (declared 10 → physical Cports 0)
// === END PORT COUNT CORRECTION ===

LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
MIXER mixer_1 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
MIXER mixer_2 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;



CHANNEL channel_1 from square_cell_trap_1 2 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_2 1 to square_cell_trap_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from square_cell_trap_2 2 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from port_2 1 to square_cell_trap_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from square_cell_trap_3 2 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from port_2 1 to square_cell_trap_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from mixer_2 2 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from mixer_3 2 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from mixer_1 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from port_2 1 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 







 

END LAYER

