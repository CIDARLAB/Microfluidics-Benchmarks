# Please add default length and width to reaction chamber component
DEVICE import_mixer_and_incubator





// === PORT COUNT CORRECTION ===
// Physical port counts in this file are authoritative for the synthesized device.
// FLOW ports: 3 (LFR module IO declared 4)
// CONTROL ports (Cport_*): 0
// Port counts differ from the original LFR IO / control bit-width.
// The physical counts above are authoritative. Common causes include
// MUX/distribute one-hot valves, metering nozzles, droplet sorters, and other mapped primitives:
//   - FLOW port count differs from LFR IO (declared 4 → physical FLOW ports 3; metering / NOZZLE DROPLET GENERATOR auxiliaries, DROPLET SORTER waste/discard ports)
// === END PORT COUNT CORRECTION ===

LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from mixer_1 2 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from mixer_2 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from port_2 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from port_3 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

