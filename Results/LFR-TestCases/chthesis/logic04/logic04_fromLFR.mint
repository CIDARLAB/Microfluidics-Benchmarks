DEVICE logic04



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from square_cell_trap_1 2 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from square_cell_trap_1 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from square_cell_trap_1 2 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from square_cell_trap_2 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from square_cell_trap_2 2 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from square_cell_trap_3 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from square_cell_trap_4 2 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from square_cell_trap_4 2 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from square_cell_trap_4 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from square_cell_trap_4 2 to port_4 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

LAYER CONTROL 

PORT Cport_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_13 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_14 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_15 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_16 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_17 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_18 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_19 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_20 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_21 componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_4 on channel_7 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_5 on channel_8 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_6 on channel_9 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_7 on channel_1 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_8 on channel_2 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_9 on channel_4 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_10 on channel_10 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_11 on channel_3 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_12 on channel_5 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_13 on channel_6 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_12 from Cport_12 1 to valve_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_13 from Cport_13 1 to valve_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_14 from Cport_14 1 to valve_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_15 from Cport_15 1 to valve_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_16 from Cport_16 1 to valve_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_17 from Cport_17 1 to valve_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_18 from Cport_18 1 to valve_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_19 from Cport_19 1 to valve_11 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_20 from Cport_20 1 to valve_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_21 from Cport_21 1 to valve_13 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

