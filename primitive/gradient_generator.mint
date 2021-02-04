DEVICE gradient_generator

LAYER FLOW

PORT p_in, p_out1, p_out2, p_out3, p_out4;

GRADIENT GENERATOR g 1 to 4 ;

CHANNEL ci1 from p_in to g 1 channelWidth=200;
CHANNEL co1 from g 2 to p_out1 channelWidth=200;
CHANNEL co2 from g 3 to p_out2 channelWidth=200;
CHANNEL co3 from g 4 to p_out3 channelWidth=200;
CHANNEL c04 from g 6 to p_out4 channelWidth=200;


END LAYER