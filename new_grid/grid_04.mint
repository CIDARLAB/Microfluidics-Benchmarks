DEVICE grid_04

LAYER FLOW 

PORT port_in portRadius=100 ;
TREE input_tree spacing=1200 flowChannelWidth=100 in=1 out=4 ;
SQUARE CELL TRAP ct_1_1 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_1_2 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_1_3 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_1_4 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_2_1 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_2_2 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_2_3 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_2_4 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_3_1 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_3_2 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_3_3 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_3_4 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_4_1 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_4_2 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_4_3 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_4_4 chamberWidth=100 chamberLength=100 channelWidth=100 ;
TREE output_tree spacing=1200 flowChannelWidth=100 in=1 out=4 ;
PORT port_out portRadius=100 ;



CHANNEL channel_in from port_in 1 to input_tree 1 channelWidth=100  ;
CHANNEL channel_horizontal_1_1 from ct_1_1 3 to ct_1_2 1 channelWidth=100  ;
CHANNEL channel_horizontal_1_2 from ct_1_2 3 to ct_1_3 1 channelWidth=100  ;
CHANNEL channel_horizontal_1_3 from ct_1_3 3 to ct_1_4 1 channelWidth=100  ;
CHANNEL channel_horizontal_2_1 from ct_2_1 3 to ct_2_2 1 channelWidth=100  ;
CHANNEL channel_horizontal_2_2 from ct_2_2 3 to ct_2_3 1 channelWidth=100  ;
CHANNEL channel_horizontal_2_3 from ct_2_3 3 to ct_2_4 1 channelWidth=100  ;
CHANNEL channel_horizontal_3_1 from ct_3_1 3 to ct_3_2 1 channelWidth=100  ;
CHANNEL channel_horizontal_3_2 from ct_3_2 3 to ct_3_3 1 channelWidth=100  ;
CHANNEL channel_horizontal_3_3 from ct_3_3 3 to ct_3_4 1 channelWidth=100  ;
CHANNEL channel_horizontal_4_1 from ct_4_1 3 to ct_4_2 1 channelWidth=100  ;
CHANNEL channel_horizontal_4_2 from ct_4_2 3 to ct_4_3 1 channelWidth=100  ;
CHANNEL channel_horizontal_4_3 from ct_4_3 3 to ct_4_4 1 channelWidth=100  ;
CHANNEL channel_vertical_1_1 from ct_1_1 4 to ct_2_1 2 channelWidth=100  ;
CHANNEL channel_vertical_1_2 from ct_1_2 4 to ct_2_2 2 channelWidth=100  ;
CHANNEL channel_vertical_1_3 from ct_1_3 4 to ct_2_3 2 channelWidth=100  ;
CHANNEL channel_vertical_1_4 from ct_1_4 4 to ct_2_4 2 channelWidth=100  ;
CHANNEL channel_vertical_2_1 from ct_2_1 4 to ct_3_1 2 channelWidth=100  ;
CHANNEL channel_vertical_2_2 from ct_2_2 4 to ct_3_2 2 channelWidth=100  ;
CHANNEL channel_vertical_2_3 from ct_2_3 4 to ct_3_3 2 channelWidth=100  ;
CHANNEL channel_vertical_2_4 from ct_2_4 4 to ct_3_4 2 channelWidth=100  ;
CHANNEL channel_vertical_3_1 from ct_3_1 4 to ct_4_1 2 channelWidth=100  ;
CHANNEL channel_vertical_3_2 from ct_3_2 4 to ct_4_2 2 channelWidth=100  ;
CHANNEL channel_vertical_3_3 from ct_3_3 4 to ct_4_3 2 channelWidth=100  ;
CHANNEL channel_vertical_3_4 from ct_3_4 4 to ct_4_4 2 channelWidth=100  ;
CHANNEL channel_in_1 from input_tree 2 to ct_1_1 2 channelWidth=100  ;
CHANNEL channel_in_2 from input_tree 3 to ct_1_2 2 channelWidth=100  ;
CHANNEL channel_in_3 from input_tree 4 to ct_1_3 2 channelWidth=100  ;
CHANNEL channel_in_4 from input_tree 5 to ct_1_4 2 channelWidth=100  ;
CHANNEL channel_out_1 from ct_4_1 4 to output_tree 2 channelWidth=100  ;
CHANNEL channel_out_2 from ct_4_2 4 to output_tree 3 channelWidth=100  ;
CHANNEL channel_out_3 from ct_4_3 4 to output_tree 4 channelWidth=100  ;
CHANNEL channel_out_4 from ct_4_4 4 to output_tree 5 channelWidth=100  ;
CHANNEL channel_out from output_tree 1 to port_out 1 channelWidth=100  ; 

END LAYER

LAYER CONTROL 

PORT port_ctrl_in_horizontal_1 portRadius=100 ;
PORT port_ctrl_in_horizontal_2 portRadius=100 ;
PORT port_ctrl_in_horizontal_3 portRadius=100 ;
PORT port_ctrl_in_horizontal_4 portRadius=100 ;
PORT port_ctrl_in_vertical_1 portRadius=100 ;
PORT port_ctrl_in_vertical_2 portRadius=100 ;
PORT port_ctrl_in_vertical_3 portRadius=100 ;

VALVE valve_horizontal_1_1 on channel_horizontal_1_1 width=300 length=100 ;
VALVE valve_horizontal_1_2 on channel_horizontal_1_2 width=300 length=100 ;
VALVE valve_horizontal_1_3 on channel_horizontal_1_3 width=300 length=100 ;
VALVE valve_horizontal_2_1 on channel_horizontal_2_1 width=300 length=100 ;
VALVE valve_horizontal_2_2 on channel_horizontal_2_2 width=300 length=100 ;
VALVE valve_horizontal_2_3 on channel_horizontal_2_3 width=300 length=100 ;
VALVE valve_horizontal_3_1 on channel_horizontal_3_1 width=300 length=100 ;
VALVE valve_horizontal_3_2 on channel_horizontal_3_2 width=300 length=100 ;
VALVE valve_horizontal_3_3 on channel_horizontal_3_3 width=300 length=100 ;
VALVE valve_horizontal_4_1 on channel_horizontal_4_1 width=300 length=100 ;
VALVE valve_horizontal_4_2 on channel_horizontal_4_2 width=300 length=100 ;
VALVE valve_horizontal_4_3 on channel_horizontal_4_3 width=300 length=100 ;
VALVE valve_vertical_1_1 on channel_vertical_1_1 width=300 length=100 ;
VALVE valve_vertical_1_2 on channel_vertical_1_2 width=300 length=100 ;
VALVE valve_vertical_1_3 on channel_vertical_1_3 width=300 length=100 ;
VALVE valve_vertical_1_4 on channel_vertical_1_4 width=300 length=100 ;
VALVE valve_vertical_2_1 on channel_vertical_2_1 width=300 length=100 ;
VALVE valve_vertical_2_2 on channel_vertical_2_2 width=300 length=100 ;
VALVE valve_vertical_2_3 on channel_vertical_2_3 width=300 length=100 ;
VALVE valve_vertical_2_4 on channel_vertical_2_4 width=300 length=100 ;
VALVE valve_vertical_3_1 on channel_vertical_3_1 width=300 length=100 ;
VALVE valve_vertical_3_2 on channel_vertical_3_2 width=300 length=100 ;
VALVE valve_vertical_3_3 on channel_vertical_3_3 width=300 length=100 ;
VALVE valve_vertical_3_4 on channel_vertical_3_4 width=300 length=100 ;

CHANNEL channel_ctrl_in_horizontal_1 from port_ctrl_in_horizontal_1 1 to valve_horizontal_1_1 1, valve_horizontal_1_2 1, valve_horizontal_1_3 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_horizontal_2 from port_ctrl_in_horizontal_2 1 to valve_horizontal_2_1 1, valve_horizontal_2_2 1, valve_horizontal_2_3 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_horizontal_3 from port_ctrl_in_horizontal_3 1 to valve_horizontal_3_1 1, valve_horizontal_3_2 1, valve_horizontal_3_3 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_horizontal_4 from port_ctrl_in_horizontal_4 1 to valve_horizontal_4_1 1, valve_horizontal_4_2 1, valve_horizontal_4_3 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_vertical_1 from port_ctrl_in_vertical_1 1 to valve_vertical_1_1 1, valve_vertical_1_2 1, valve_vertical_1_3 1, valve_vertical_1_4 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_vertical_2 from port_ctrl_in_vertical_2 1 to valve_vertical_2_1 1, valve_vertical_2_2 1, valve_vertical_2_3 1, valve_vertical_2_4 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_vertical_3 from port_ctrl_in_vertical_3 1 to valve_vertical_3_1 1, valve_vertical_3_2 1, valve_vertical_3_3 1, valve_vertical_3_4 1 channelWidth=100  ; 

END LAYER

