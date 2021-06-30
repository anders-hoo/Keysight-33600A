Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Timebase Verification
DATE:                  2021-06-30 13:23:42
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       38
CONFIGURATION:         Agilent 53131A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  WAIT         [D200]
  1.002  SCPI         *RST

  1.003  IF           @channels == 2
  1.004  DISP         Connect UUT CHANNEL 1 to HP 53131A CHANNEL 1 using
  1.004  DISP         coaxial cable.
  1.005  SCPI         DISPlay:FOCus CH[V @source]
  1.006  ELSE
  1.007  DISP         Connect UUT OUTPUT to HP 53131A CHANNEL 1 using
  1.007  DISP         coaxial cable.

  1.008  ENDIF

  1.009  SCPI         OUTP[V @source]:LOAD 50
  1.010  SCPI         SOURCE[V @source]:VOLT:UNIT VPP
  1.011  SCPI         SOURCE[V @source]:APPLy:SIN 10e6,1 VPP,0[D2000]

  1.012  IEEE         [@53131]*RST;*SRE 0;*OPC?[I!][D1000]
  1.013  IEEE         [@53131]:EVENt1:LEVel:AUTO OFF;*OPC?[I!][D1000]
  1.013  IEEE         [@53131]:EVENt1:LEVel 0;*OPC?[I!][D1000]
  1.014  IEEE         [@53131]:INP1:IMP 50;*OPC?[I!][D1000]
  1.015  IEEE         [@53131]:INIT[D5000]
  1.016  IEEE         [@53131]:READ:FREQ?[I]
  1.017  MEMC         10000000.00H   10.00U

  2.001  END
