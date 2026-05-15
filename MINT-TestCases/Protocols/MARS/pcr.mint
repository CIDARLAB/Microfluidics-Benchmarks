# Mirrored from LFR-TestCases/Protocols/MARS/pcr.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE pcr



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_2 1 to square_cell_trap_1 1 connectionSpacing=1000;

 

END LAYER

