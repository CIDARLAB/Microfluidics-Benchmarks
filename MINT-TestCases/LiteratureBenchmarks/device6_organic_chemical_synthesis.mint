DEVICE organic_chemical_synthesis

LAYER FLOW

PORT p1, p2, p3;
PORT p4, p5, p6, p7;
PORT p8, p9, p10;
PORT p11, p12, p13, p14;

NODE n1;

CONNECTION c1 from p1 1 to n1;
CONNECTION c2 from p2 1 to n1;
CONNECTION c3 from p3 1 to n1;

NODE n2;
CONNECTION c4 from p4 1 to n2;
CONNECTION c5 from p5 1 to n2;
CONNECTION c6 from p6 1 to n2;

CONCENTRATION LOOP cl;

CONNECTION c4 from n1 to cl 1;

PORT p15, p16, p17;
NODE n3;

CONNECTION c5 from p15 1 to n3 1;
CONNECTION c6 from p16 1 to n3 1;
CONNECTION c7 from p17 1 to n3 1;
CONNECTION c8 from n3 1 to cl 2;

PORT p18;
CONNECTION c9 from p18 1 to cl 9;

PORT p19, p20, p21;
NODE n4, n5;
CONNECTION c10 from cl 7 to n4 1;
CONNECTION c11 from p19 to n4 1;
CONNECTION c12 from n4 1 to n5 1;
CONNECTION c13 from p20 1 to n5 1;
CONNECTION c14 from p21 1 to n5 1;

REACTION LOOP rl;
CONNECTION c15 from n5 1 to rl 1;

PORT p22, p23;
NODE n6;
CONNECTION c16 from p22 1 to n6 1;
CONNECTION c17 from p23 1 to n6 1;
CONNECTION c18 from n6 1 to rl 5;

PORT p24;
CONNECTION c19 from p24 1 to rl 7;

PORT p25;
CONNECTION c20 from p25 1 to rl 6;

END LAYER

LAYER CONTROL

PORT cp1, cp2, cp3;

VALVE pv1 on c1;
VALVE pv2 on c1;
VALVE pv3 on c1;

VALVE pv4 on c2;
VALVE pv5 on c2;
VALVE pv6 on c2;

VALVE pv7 on c3;
VALVE pv8 on c3;
VALVE pv9 on c3;

CONNECTION cc1 from cp1 1 to pv1 1;
CONNECTION cc2 from pv1 1 to pv4 1;
CONNECTION cc3 from pv4 1 to pv7 1;

CONNECTION cc4 from cp2 1 to pv2 1;
CONNECTION cc5 from pv2 1 to pv5 1;
CONNECTION cc6 from pv5 1 to pv8 1;

CONNECTION cc7 from cp3 1 to pv3 1;
CONNECTION cc8 from pv3 1 to pv6 1;
CONNECTION cc9 from pv6 1 to pv9 1;

VALVE rv10 on c1;
VALVE rv11 on c2;
VALVE rv12 on c3;
VALVE rv13 on c4;

PORT cp4, cp5, cp6, cp7;
CONNECTION cc10 from cp4 1 to rv10 1;
CONNECTION cc11 from cp5 1 to rv11 1;
CONNECTION cc12 from cp6 1 to rv12 1;
CONNECTION cc13 from cp7 1 to rv13 1;

VALVE rv14 on c5;
VALVE rv15 on c6;
VALVE rv16 on c7;
VALVE rv17 on c8;

PORT cp8, cp9, cp10, cp11;
CONNECTION cc14 from cp8 1 to rv14 1;
CONNECTION cc15 from cp9 1 to rv15 1;
CONNECTION cc16 from cp10 1 to rv16 1;
CONNECTION cc17 from cp11 1 to rv17 1;

VALVE rv18 on c9;
PORT cp12;
CONNECTION cc18 from cp12 1 to rv18 1;

PORT cp13, cp14;
CONNECTION cc19 from cp13 1 to cl 3;
CONNECTION cc20 from cp14 1 to cl 8;

VALVE rv19 on c11;
PORT cp15;
CONNECTION cc21 from cp15 1 to rv19 1;

VALVE rv20 on c12;
PORT cp16;
CONNECTION cc22 from cp16 1 to rv20 1;

VALVE rv21 on c13;
PORT cp17;
CONNECTION cc23 from cp17 1 to rv21 1;

VALVE rv22 on c14;
PORT cp18;
CONNECTION cc24 from cp18 1 to rv22 1;

VALVE rv23 on c15;
PORT cp19;
CONNECTION cc25 from cp19 1 to rv23 1;

VALVE rv24 on c16;
PORT cp20;
CONNECTION cc26 from cp20 1 to rv24 1;

VALVE rv25 on c17;
PORT cp21;
CONNECTION cc27 from cp21 1 to rv25 1;

VALVE rv26 on c18;
PORT cp22;
CONNECTION cc28 from cp22 1 to rv26 1;

VALVE rv27 on c19;
VALVE rv28 on c19;
PORT cp23, cp24;
CONNECTION cc29 from cp23 1 to rv27 1;
CONNECTION cc30 from cp24 1 to rv28 1;

VALVE rv29 on c20;
VALVE rv30 on c20;
PORT cp25, cp26;
CONNECTION cc31 from cp25 1 to rv29 1;
CONNECTION cc32 from cp26 1 to rv30 1;

PORT cp27, cp28, cp29;

CONNECTION cc33 from cp27 1 to rl 2;
CONNECTION cc34 from rl 2 to cl 6;
CONNECTION cc35 from cp28 1 to rl 3;
CONNECTION cc36 from rl 3 to cl 5;
CONNECTION cc37 from cp29 1 to rl 4;
CONNECTION cc38 from rl 4 to cl 4;

END LAYER
