DEVICE Fluorescence





// === PORT COUNT CORRECTION ===
// Physical port counts in this file are authoritative for the synthesized device.
// FLOW ports: 7 (LFR module IO declared 3)
// CONTROL ports (Cport_*): 1 (LFR control bit width declared 1)
// VALVE/VALVE3D count: 1
// Port counts differ from the original LFR IO / control bit-width.
// The physical counts above are authoritative. Common causes include
// MUX/distribute one-hot valves, metering nozzles, droplet sorters, and other mapped primitives:
//   - FLOW port count differs from LFR IO (declared 3 → physical FLOW ports 7; metering / NOZZLE DROPLET GENERATOR auxiliaries, DROPLET SORTER waste/discard ports)
// === END PORT COUNT CORRECTION ===

LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_3 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
PORT port_4 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from port_1 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000 crossSection=1  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000 crossSection=1  ;
CHANNEL channel_3 from port_3 1 to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000 crossSection=1  ;
CHANNEL channel_4 from port_4 1 to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000 crossSection=1  ;
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_6 from nozzle_droplet_generator_2 3 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_7 from mixer_1 2 to square_cell_trap_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_8 from port_5 1 to square_cell_trap_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_9 from port_6 1 to nozzle_droplet_generator_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_10 from port_7 1 to nozzle_droplet_generator_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_8 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

