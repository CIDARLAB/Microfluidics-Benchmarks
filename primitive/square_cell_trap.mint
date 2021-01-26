DEVICE square_cell_trap


LAYER FLOW

PORT p1, p2, p3, p4;

SQUARE CELL TRAP s;

CHANNEL c1 from p1 to s 1 channelWidth=200;
CHANNEL c2 from p2 to s 2 channelWidth=200;
CHANNEL c3 from p3 to s 3 channelWidth=200;
CHANNEL c4 from p4 to s 4 channelWidth=200;

END LAYER