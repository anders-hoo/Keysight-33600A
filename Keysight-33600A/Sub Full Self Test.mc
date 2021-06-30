Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Full Self Test
DATE:                  2021-06-30 11:36:07
AUTHOR:                Antti Harala
REVISION:              1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       17
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  WAIT         [D200]
  1.003  SCPI         [T45000]*TST?[I]
  1.004  EVAL   -e MEM == 0 : Self Test

  2.001  END
