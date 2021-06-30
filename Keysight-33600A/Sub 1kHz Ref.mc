Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub 5790 Ref
INSTRUMENT:            Sub FSMR Ref
DATE:                  2021-06-30 08:38:25
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       40
CONFIGURATION:         Fluke 5790A
CONFIGURATION:         FSMR26-N
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  JMPL         5790 FIND(PROC(),"5790",0) >= 1
  1.002  JMPL         FSMR FIND(PROC(),"FSMR",0) >= 1

  1.003  END

  1.004  LABEL        5790
  1.005  SCPI         OUTP[V @source]:LOAD 50
  1.006  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  1.007  SCPI         [@5790][T60000]RANGE [V @v_ampl];HIRES 0 ; DFILT OFF ; INPUT WBND; EXTRIG 0; REFCLR
  1.008  SCPI         SOURCE[V @source]:APPLy:SIN 1e3,[V @v_ampl],0
  1.009  CALL         Sub Check Reading 5790
  1.010  SCPI         [@5790][T60000]HIRES 1 ; DFILT MEDIUM,MEDIUM ;EXTRIG 1
  1.011  SCPI         [@5790][T60000]TRIG;*WAI
  1.011  SCPI         [@5790][T60000]REFSET;DUNIT DB
  1.012  SCPI         OUTP[V @source] OFF
  1.013  END

  1.014  LABEL        FSMR
  1.015  SCPI         OUTP[V @source]:LOAD 50
  1.016  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  1.016  SCPI         [@FSMR]INIT:CONT ON
  1.017  SCPI         SOURCE[V @source]:APPLy:SIN 1e3,[V @v_ampl],0[D5000]
  1.018  SCPI         [@FSMR]:CALC:PMET:REL:AUTO ONCE
  1.019  SCPI         OUTP[V @source] OFF
  1.020  END
