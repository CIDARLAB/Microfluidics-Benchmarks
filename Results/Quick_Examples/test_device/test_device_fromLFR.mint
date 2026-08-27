DEVICE test_device







// === PORT COUNT CORRECTION ===
// Physical port counts in this file are authoritative for the synthesized device.
// FLOW ports: 11 (LFR module IO declared 4)
// CONTROL ports (Cport_*): 11 (LFR control bit width declared 1)
// VALVE/VALVE3D count: 11
// Port counts differ from the original LFR IO / control bit-width.
// The physical counts above are authoritative. Common causes include
// MUX/distribute one-hot valves, metering nozzles, droplet sorters, and other mapped primitives:
//   - CONTROL expansion via distribute/MUX/transposer/if-else (LFR control bits 1 → physical Cports 11, valves 11)
//   - FLOW port count differs from LFR IO (declared 4 → physical FLOW ports 11; metering / NOZZLE DROPLET GENERATOR auxiliaries, DROPLET SORTER waste/discard ports)
// === END PORT COUNT CORRECTION ===

LAYER FLOW 

VIA via_1 componentSpacing=1000.0 radius=700.0 height=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
VIA via_2 componentSpacing=1000.0 radius=700.0 height=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
VIA via_3 componentSpacing=1000.0 radius=700.0 height=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_8 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_9 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_10 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_11 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from via_1 1 to via_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_2 from via_1 1 to via_3 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_3 from via_1 1 to port_3 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_4 from via_1 1 to port_4 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_5 from via_1 1 to port_5 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_6 from via_1 1 to port_6 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_7 from via_1 1 to port_7 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_8 from via_2 1 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_9 from via_3 1 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_10 from port_8 1 to via_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_11 from port_9 1 to via_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_12 from port_10 1 to via_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_13 from port_11 1 to via_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_8 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_9 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_10 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_2 on channel_12 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_3 on channel_13 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_4 on channel_6 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_5 on channel_7 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_6 on channel_5 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_7 on channel_4 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_8 on channel_3 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_9 on channel_2 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_10 on channel_1 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_7 from Cport_7 1 to valve_7 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_8 from Cport_8 1 to valve_8 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_9 from Cport_9 1 to valve_9 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_10 from Cport_10 1 to valve_10 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

