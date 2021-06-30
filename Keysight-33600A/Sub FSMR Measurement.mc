Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub FSMR Measurement
DATE:                  2021-06-30 08:33:45
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       20
CONFIGURATION:         FSMR26-N
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         OUTP[V @source]:LOAD 50
  1.002  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  1.003  SCPI         [@FSMR]INIT:CONT ON
  1.004  SCPI         SOURCE[V @source]:APPLy:SIN [V @freq],[V @v_ampl] VRMS,0[D5000]
  1.005  SCPI         [@FSMR]FETC:PMET?[I]
  1.006  MATH         f_text = ENGR_NSD(@freq,"Hz",1)
  1.007  TSET         TDESC = [V f_text] at [V @v_ampl] Vrms
  1.008  END
