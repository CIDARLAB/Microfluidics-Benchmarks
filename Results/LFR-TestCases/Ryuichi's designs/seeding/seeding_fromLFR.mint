DEVICE seeding



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_2 1 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_4 1 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT Cport_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_2 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_1 on channel_3 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

