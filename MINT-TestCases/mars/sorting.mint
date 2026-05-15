# Mirrored from LFR-TestCases/mars/sorting.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE sorting



LAYER FLOW 

DROPLET SORTER droplet_sorter_1 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;
PORT port_3 componentSpacing=9000;
PORT port_4 componentSpacing=9000;



CHANNEL channel_1 from droplet_sorter_1 3 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_4 1 to droplet_sorter_1 1 connectionSpacing=1000;

 

END LAYER

