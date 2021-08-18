DEVICE dx15_ref

LAYER FLOW 

PORT port_in1, port_in2, port_in3;

MIXER mixer1;

CHANNEL c1 from port_in1 to mixer1 1;
CHANNEL c2 from port_in2 to mixer1 1;
CHANNEL c3 from port_in3 to mixer1 1;

DROPLET SORTER droplet_sorter1;

CHANNEL c4 from mixer1 2 to droplet_sorter1 1;

PORT port_out_keep, port_out_waste;

CHANNEL c5 from droplet_sorter1 3 to port_out_keep 1;
CHANNEL c6 from droplet_sorter1 2 to port_out_waste 1;

END LAYER

