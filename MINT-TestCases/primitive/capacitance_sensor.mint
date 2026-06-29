DEVICE capacitance_sensor

LAYER flow

PORT p1, p2;

DROPLET CAPACITANCE SENSOR cs1;

CHANNEL c1 from p1 to cs1 1channelWidth=400;
CHANNEL c2 from p2 to cs1 2channelWidth=400;

END layer