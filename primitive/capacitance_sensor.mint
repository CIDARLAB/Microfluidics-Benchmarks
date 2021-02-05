DEVICE capacitance_sensor

LAYER FLOW

PORT p1, p2;

DROPLET CAPACITANCE SENSOR cs1;

CHANNEL c1 from p1 to cs1 1 channelWidth=400;
CHANNEL c2 from p2 to cs1 2 channelWidth=400;

END LAYER