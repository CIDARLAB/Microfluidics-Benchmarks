DEVICE bacteria_diagnostics

LAYER FLOW

PORT p1, p2, p3, p4;

MIXING CHAMBER mc;
DETECTION CHAMBER dc;

CONNECTION c1 from p1 to mc 1;
CONNECTION c2 from p2 to mc 2;
CONNECTION c3 from p3 to dc 1;
CONNECTION c4 from dc 2 to mc 3;
CONNECTION c5 from mc 4 to p4;

END LAYER

LAYER CONTROL

PORT cp1, cp2;

VALVE v1 on c1;
VALVE v2 on c2;
VALVE v3 on c4;
VALVE v4 on c5;

CONNECTION cn1 from cp1 to v1, v4;
CONNECTION cc1 from v1 to v2;
CONNECTION cc2 from cp2 to v3;

END LAYER
