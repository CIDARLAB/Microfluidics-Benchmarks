DEVICE simple



LAYER FLOW 

CELL TRAPPER cell_trapper_1 ;
PORT port_1 ;
MIXER mixer_1 ;
PORT port_2 ;
PORT port_3 ;



CHANNEL channel_1 from cell_trapper_1 2 to port_1   ;
CHANNEL channel_2 from mixer_1 2 to cell_trapper_1 1  ;

 

END LAYER

