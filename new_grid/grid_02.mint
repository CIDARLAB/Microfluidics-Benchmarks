DEVICE grid_02

LAYER FLOW 

PORT port_in portRadius=100 ;
TREE input_tree spacing=1200 flowChannelWidth=100 in=1 out=2 ;
SQUARE CELL TRAP ct_1_1 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_1_2 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_2_1 chamberWidth=100 chamberLength=100 channelWidth=100 ;
SQUARE CELL TRAP ct_2_2 chamberWidth=100 chamberLength=100 channelWidth=100 ;
TREE output_tree spacing=1200 flowChannelWidth=100 in=1 out=2 ;
PORT port_out portRadius=100 ;



CHANNEL channel_in from port_in 1 to input_tree 1 channelWidth=100  ;
CHANNEL channel_horizontal_1_1 from ct_1_1 2 to ct_1_2 4 channelWidth=100  ;
CHANNEL channel_horizontal_2_1 from ct_2_1 2 to ct_2_2 4 channelWidth=100  ;
CHANNEL channel_vertical_1_1 from ct_1_1 3 to ct_2_1 1 channelWidth=100  ;
CHANNEL channel_vertical_1_2 from ct_1_2 3 to ct_2_2 1 channelWidth=100  ;
CHANNEL channel_in_1 from input_tree 2 to ct_1_1 1 channelWidth=100  ;
CHANNEL channel_in_2 from input_tree 3 to ct_1_2 1 channelWidth=100  ;
CHANNEL channel_out_1 from ct_2_1 3 to output_tree 2 channelWidth=100  ;
CHANNEL channel_out_2 from ct_2_2 3 to output_tree 3 channelWidth=100  ;
CHANNEL channel_out from output_tree 1 to port_out 1 channelWidth=100  ; 

END LAYER

LAYER CONTROL 

PORT port_ctrl_in_horizontal_1 portRadius=100 ;
PORT port_ctrl_in_horizontal_2 portRadius=100 ;
PORT port_ctrl_in_vertical_1 portRadius=100 ;

VALVE valve_horizontal_1_1 on channel_horizontal_1_1 width=300 length=100 ;
VALVE valve_horizontal_2_1 on channel_horizontal_2_1 width=300 length=100 ;
VALVE valve_vertical_1_1 on channel_vertical_1_1 width=300 length=100 ;
VALVE valve_vertical_1_2 on channel_vertical_1_2 width=300 length=100 ;

CHANNEL channel_ctrl_in_horizontal_1 from port_ctrl_in_horizontal_1 1 to valve_horizontal_1_1 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_horizontal_2 from port_ctrl_in_horizontal_2 1 to valve_horizontal_2_1 1 channelWidth=100  ;
CHANNEL channel_ctrl_in_vertical_1 from port_ctrl_in_vertical_1 1 to valve_vertical_1_1 1, valve_vertical_1_2 1 channelWidth=100  ; 

END LAYER

