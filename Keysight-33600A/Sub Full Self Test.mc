Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Full Self Test
DATE:                  2021-06-28 09:36:09
AUTHOR:                Antti Harala
REVISION:              1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       2
NUMBER OF LINES:       18
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         *RST
  1.002  SCPI         [T45000]*TST?[I]
  1.003  EVAL   -e MEM == 0 : Self Test

  2.001  END
