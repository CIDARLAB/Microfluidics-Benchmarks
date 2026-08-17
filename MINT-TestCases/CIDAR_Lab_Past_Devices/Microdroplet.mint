DEVICE Microdroplet






// === PORT COUNT CORRECTION ===
// Physical port counts in this file are authoritative for the synthesized device.
// FLOW ports: 13 (LFR module IO declared 9)
// CONTROL ports (Cport_*): 9 (LFR control bit width declared 9)
// VALVE/VALVE3D count: 1
// Port counts differ from the original LFR IO / control bit-width.
// The physical counts above are authoritative. Common causes include
// MUX/distribute one-hot valves, metering nozzles, droplet sorters, and other mapped primitives:
//   - FLOW port count differs from LFR IO (declared 9 → physical FLOW ports 13; metering / NOZZLE DROPLET GENERATOR auxiliaries, DROPLET SORTER waste/discard ports)
// === END PORT COUNT CORRECTION ===

LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_6 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
PORT port_7 portRadius=2000 componentSpacing=1000.0 height=1100.0 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_8 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_9 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_10 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_13 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;



CHANNEL channel_1 from port_1 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_3 from port_6 1 to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_4 from port_7 1 to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from nozzle_droplet_generator_2 3 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from square_cell_trap_1 2 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from square_cell_trap_1 2 to port_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from square_cell_trap_1 2 to port_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_10 from mixer_5 2 to mixer_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_11 from mixer_9 2 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_12 from mixer_7 2 to mixer_8 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_13 from mixer_4 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_14 from mixer_10 2 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_15 from mixer_2 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_16 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_17 from mixer_3 2 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_18 from mixer_6 2 to mixer_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_19 from mixer_8 2 to mixer_9 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_20 from port_8 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_21 from port_8 1 to mixer_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_22 from port_9 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_23 from port_9 1 to mixer_8 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_24 from port_10 1 to mixer_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_25 from port_10 1 to mixer_10 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_26 from port_11 1 to mixer_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_27 from port_11 1 to mixer_10 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_28 from port_12 1 to mixer_9 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_29 from port_12 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_30 from port_13 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_31 from port_13 1 to mixer_7 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT Cport_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;

VALVE3D valve_0 on channel_11 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_7 from Cport_7 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_8 from Cport_8 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

