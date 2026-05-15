# Mirrored from LFR-TestCases/Ryuichi's designs/genetic_clock_testing_tool.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE genetic_clock_testing_tool



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000;
MIXER mixer_1 componentSpacing=9000;
MIXER mixer_2 componentSpacing=9000;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=9000;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=9000;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;
PORT port_3 componentSpacing=9000;



CHANNEL channel_1 from square_cell_trap_1 2 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_2 from square_cell_trap_3 2 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_3 from square_cell_trap_4 2 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_4 from mixer_2 2 to square_cell_trap_2 1 connectionSpacing=1000;
CHANNEL channel_5 from mixer_1 2 to mixer_2 1 connectionSpacing=1000;

 

END LAYER

