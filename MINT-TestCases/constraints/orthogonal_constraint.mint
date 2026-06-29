DEVICE orthogonal_constraint

LAYER flow

PORT north, east, west, southportRadius=2000;

NODE n1;

CHANNEL c_north from  n1 to northchannelWidth=400;
CHANNEL c_south from  n1 to southchannelWidth=400;
CHANNEL c_east from n1  to eastchannelWidth=400;
CHANNEL c_west from n1  to westchannelWidth=400;

END layer