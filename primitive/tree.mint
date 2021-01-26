DEVICE tree

LAYER FLOW

PORT p_in, p_out1, p_out2, p_out3, p_out4;

TREE t 1 to 4;

CHANNEL ci1 from p_in to t 1 channelWidth=200;
CHANNEL co1 from t 2 to p_out1 channelWidth=200;
CHANNEL co2 from t 3 to p_out2 channelWidth=200;
CHANNEL co3 from t 4 to p_out3 channelWidth=200;
CHANNEL c04 from t 6 to p_out4 channelWidth=200;

END LAYER