DEVICE orthogonal_constraint

LAYER FLOW

PORT north, east, west, south portRadius=2000;

NODE n1;

CHANNEL c_north from  n1 to north  channelWidth=400;
CHANNEL c_south from  n1 to south  channelWidth=400;
CHANNEL c_east from n1  to east  channelWidth=400;
CHANNEL c_west from n1  to west  channelWidth=400;

END LAYER