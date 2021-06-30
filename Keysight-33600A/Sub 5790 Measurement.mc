Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub 5790 Measurement
DATE:                  2021-06-30 07:20:54
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       22
CONFIGURATION:         Fluke 5790A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         OUTP[V @source]:LOAD 50
  1.002  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  1.003  SCPI         [@5790][T60000]RANGE [V @v_ampl];HIRES 0 ; DFILT OFF ; INPUT WBND; EXTRIG 0
  1.004  SCPI         SOURCE[V @source]:APPLy:SIN [V @freq],[V @v_ampl] VRMS,0
  1.005  CALL         Sub Check Reading 5790
  1.006  SCPI         [@5790][T60000]HIRES 1 ; DFILT MEDIUM,MEDIUM ; EXTRIG 1
  1.007  SCPI         [@5790][T60000]TRIG;*WAI
  1.007  SCPI         [@5790][T60000]DELTA?[I]
  1.008  MATH         f_text = ENGR_NSD(@freq,"Hz",1)
  1.009  TSET         TDESC = [V f_text] at [V @v_ampl] Vrms
  1.010  END
