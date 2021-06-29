Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub FSMR Measurement
DATE:                  2021-06-29 12:21:05
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       26
CONFIGURATION:         FSMR26-N
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  IF           FAIL()
  1.002  SCPI         [@FSMR]:CALC:PMET:REL [V @ref_1k]
  1.003  ENDIF

  1.004  SCPI         OUTP:LOAD 50
  1.005  SCPI         VOLT:UNIT VRMS
  1.006  SCPI         [@FSMR]INIT:CONT OFF
  1.007  SCPI         [@FSMR]:CALC:PMET:REL:STAT ON
  1.008  SCPI         APPLy:SIN [V @freq],[V @v_ampl],0[D1000]
  1.009  SCPI         [@FSMR]INIT;*WAI
  1.009  SCPI         [@FSMR]FETC:PMET?[I]
  1.010  MATH         f_text = ENGR_NSD(@freq,"Hz",1)
  1.011  TSET         TDESC = [V f_text] at [V @v_ampl] Vrms
  1.012  END
