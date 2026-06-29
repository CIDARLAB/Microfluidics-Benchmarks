# Mirrored from LFR-TestCases/Ryuichi's designs/microreactor.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE microreactor



LAYER flow

SQUARE CELL TRAP square_cell_trap_1componentSpacing=9000;
MIXER mixer_1componentSpacing=9000;
MIXER mixer_2componentSpacing=9000;
MIXER mixer_3componentSpacing=9000;
SQUARE CELL TRAP square_cell_trap_2componentSpacing=9000;
SQUARE CELL TRAP square_cell_trap_3componentSpacing=9000;
MIXER mixer_4componentSpacing=9000;
MIXER mixer_5componentSpacing=9000;
PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;



CHANNEL channel_1 from square_cell_trap_1 2 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_2 from square_cell_trap_1 2 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_3 from square_cell_trap_2 2 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_4 from square_cell_trap_3 2 to mixer_4 1 connectionSpacing=1000;
CHANNEL channel_5 from square_cell_trap_3 2 to mixer_5 1 connectionSpacing=1000;
CHANNEL channel_6 from mixer_4 2 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_7 from mixer_2 2 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_8 from port_1 1 to mixer_4 1 connectionSpacing=1000;
CHANNEL channel_9 from port_1 1 to mixer_5 1 connectionSpacing=1000;
CHANNEL channel_10 from port_1 1 to mixer_1 1 connectionSpacing=1000;

 

END layer

LAYER control







 

END layer

