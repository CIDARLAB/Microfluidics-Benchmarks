DEVICE multi_input



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
MIXER mixer_1 componentSpacing=9000;
MIXER mixer_2 componentSpacing=9000;
PORT port_2 componentSpacing=9000;
PORT port_3 componentSpacing=9000;
PORT port_4 componentSpacing=9000;
PORT port_5 componentSpacing=9000;
PORT port_6 componentSpacing=9000;
PORT port_7 componentSpacing=9000;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from mixer_1 2 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_3 from mixer_2 2 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_4 from port_2 1 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_5 from port_3 1 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_6 from port_4 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_7 from port_5 1 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_8 from port_6 1 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_9 from port_7 1 to mixer_1 1 connectionSpacing=1000;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=9000;
PORT Cport_1 componentSpacing=9000;

VALVE valve_0 on channel_7 controlPort=Cport_0 componentSpacing=9000;
VALVE valve_1 on channel_8 controlPort=Cport_1 componentSpacing=9000;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 connectionSpacing=1000;

 

END LAYER

