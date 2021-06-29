Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub 5790 Ref
INSTRUMENT:            Sub FSMR Ref
DATE:                  2021-06-29 16:42:15
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       37
CONFIGURATION:         Fluke 5790A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON

  1.001  JMPL         5790 PROC() == "Sub 5790 Ref"
  1.002  JMPL         FSMR PROC() == "Sub FSMR Ref"

  1.003  END

  1.004  LABEL        5790
  1.005  MATH         @v_ampl = 0.354
  1.006  SCPI         OUTP:LOAD 50
  1.007  SCPI         VOLT:UNIT VRMS
  1.008  SCPI         [@5790][T60000]RANGE [V @v_ampl];HIRES 0 ; DFILT OFF ; INPUT WBND; EXTRIG 0
  1.009  SCPI         APPLy:SIN 1e3,[V @v_ampl],0
  1.010  CALL         Sub Check Reading 5790
  1.011  SCPI         [@5790][T60000]RANGE [V @v_ampl];HIRES 1 ; DFILT MEDIUM,MEDIUM ; INPUT WBND; EXTRIG 0
  1.012  SCPI         [@5790]REFSET;DUNIT DB
  1.013  SCPI         OUTP OFF
  1.014  END



  1.015  LABEL        FSMR


  1.016  END
