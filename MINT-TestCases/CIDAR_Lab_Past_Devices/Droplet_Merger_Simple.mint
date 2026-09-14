DEVICE Droplet_Merger_Simple
LAYER FLOW

PORT oil_a1, oil_a2, oil_b1, oil_b2, aqueous, droplets portRadius=1000 height=1100;

NODE join_a;
NODE join_b;

MIXER mixer_a componentSpacing=1000 channelWidth=800 bendSpacing=1230 numberOfBends=1 bendLength=2460 height=250;
MIXER mixer_b componentSpacing=1000 channelWidth=800 bendSpacing=1230 numberOfBends=1 bendLength=2460 height=250;

NOZZLE DROPLET GENERATOR dg rotation=90.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0;

CHANNEL ca1 from oil_a1 2 to join_a 1 channelWidth=600;
CHANNEL ca2 from oil_a2 2 to join_a 3 channelWidth=600;
CHANNEL ca3 from join_a 2 to mixer_a 1 channelWidth=600;
CHANNEL ca4 from mixer_a 2 to dg 3 channelWidth=600;

CHANNEL cb1 from oil_b1 4 to join_b 1 channelWidth=600;
CHANNEL cb2 from oil_b2 4 to join_b 3 channelWidth=600;
CHANNEL cb3 from join_b 4 to mixer_b 1 channelWidth=600;
CHANNEL cb4 from mixer_b 2 to dg 1 channelWidth=600;

CHANNEL cw from aqueous 1 to dg 4 channelWidth=600;
CHANNEL cout from dg 2 to droplets 1 channelWidth=600;

END LAYER
