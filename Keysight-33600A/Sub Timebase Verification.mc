Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Timebase Verification
DATE:                  2021-06-29 12:44:36
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       33
CONFIGURATION:         Agilent 53131A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         *RST

  1.002  DISP         Connect UUT OUTPUT to HP 53131A CHANNEL 1 using
  1.002  DISP         coaxial cable.

  1.003  SCPI         OUTP:LOAD 50
  1.004  SCPI         VOLT:UNIT VPP
  1.005  SCPI         APPLy:SIN 10e6,1,0[D1000]

  1.006  IEEE         [@53131]*RST[D1000]
  1.007  IEEE         [@53131]:INP1:FILT:LPAS:STAT ON[D100]
  1.007  IEEE         [@53131]:EVENt1:LEVel:AUTO OFF[D100]
  1.007  IEEE         [@53131]:EVENt1:LEVel 0[D100]
  1.008  IEEE         [@53131]:INP1:IMP 50[D100]
  1.009  IEEE         [@53131]:FREQ:ARM:STAR:SOUR IMM[D100]
  1.010  IEEE         [@53131]:FREQ:ARM:STOP:SOUR TIM[D100]
  1.011  IEEE         [@53131]:FREQ:ARM:STOP:TIM 1[D100]
  1.012  IEEE         [@53131]:READ:FREQ?[I]
  1.013  MEMC         10000000H      10U

  2.001  END
