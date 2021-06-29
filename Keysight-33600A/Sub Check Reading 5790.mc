Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Check Reading 5790
DATE:                  2021-06-29 16:33:44
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       20
CONFIGURATION:         Fluke 5790A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  MATH         counter = 0
  1.002  DO
  1.003  SCPI         [@5790]VAL?[I$][D200]
  1.004  MATH         status = FLD(MEM2,3,",")
  1.005  MATH         counter = counter + 1
  1.006  UNTIL        status == 0 || status == 3 || status == 4 || counter > 200

  1.007  END
