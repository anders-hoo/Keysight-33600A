Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub 5790 Measurement
DATE:                  2021-06-29 16:42:00
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       23
CONFIGURATION:         Fluke 5790A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         OUTP:LOAD 50
  1.002  SCPI         VOLT:UNIT VRMS
  1.003  SCPI         [@5790][T60000]RANGE [V @v_ampl];HIRES 0 ; DFILT OFF ; INPUT WBND; EXTRIG 0
  1.004  SCPI         APPLy:SIN [V @freq],[V @v_ampl],0
  1.005  CALL         Sub Check Reading 5790
  1.006  SCPI         [@5790][T60000]RANGE [V @v_ampl];HIRES 1 ; DFILT MEDIUM,MEDIUM ; INPUT WBND; EXTRIG 0
  1.007  SCPI         [@5790][T10000]DELTA?[I]
  1.008  SCPI         OUTP OFF
  1.009  MATH         f_text = ENGR_NSD(@freq,"Hz",1)
  1.010  TSET         TDESC = [V f_text] at [V @v_ampl] Vrms
  1.011  END
