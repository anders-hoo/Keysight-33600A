Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub DCOFF
DATE:                  2021-06-29 10:54:38
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       4
NUMBER OF LINES:       68
CONFIGURATION:         Fluke 8508A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         [T20000]*RST[D500]
  1.002  SCPI         [@8508][T20000]*RST[D500]

  1.003  IF           @v_cal == 0
  1.004  OPBR         Do you want to Zero Fluke 8508 AC and DC Voltage?
  1.005  IF           MEM1 == 1
  1.006  SCPI         [@8508]DCV AUTO, FILT_OFF, RESL7, FAST_ON, TWO_WR;GUARD INT
  1.007  DISP         Connect Fluke 4W short to 8508A.
  1.008  WAIT         -a -t 15 DCV Zero: Please wait for emf dissapation.
  1.009  SCPI         [@8508][T120000]MZERO?
  1.010  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT
  1.011  WAIT         -a -t 15 ACV Zero: Please wait for emf dissapation.
  1.012  SCPI         [@8508][T120000]MZERO?
  1.013  DISP         Remove the 4W short.
  1.014  ENDIF
  1.015  ENDIF

  1.016  IF           @8508_conn == 0
  1.017  DISP         Connect UUT OUTPUT to 8508A INPUT HI and LO using
  1.017  DISP         coax and coax to banana plug adapter.
  1.018  ENDIF


  1.019  TARGET       -p
  1.020  SCPI         OUTP:LOAD INF
  1.021  SCPI         FUNC DC
  1.022  SCPI         VOLT:OFFS 0
  1.023  SCPI         OUTP ON

  1.024  SCPI         [@8508]DCV AUTO, RESL7, FILT_ON, FAST_OFF, TWO_WR;GUARD INT;TRG_SRCE EXT[D200]
  1.025  SCPI         [@8508][T30000]X?[I]
  1.026  MEMC         0.000V         0.002U

  2.001  TARGET       -p
  2.002  SCPI         OUTP:LOAD INF
  2.003  SCPI         FUNC DC
  2.004  SCPI         VOLT:OFFS 0.500
  2.005  SCPI         OUTP ON

  2.006  SCPI         [@8508]DCV AUTO, RESL7, FILT_ON, FAST_OFF, TWO_WR;GUARD INT;TRG_SRCE EXT[D200]
  2.007  SCPI         [@8508][T30000]X?[I]
  2.008  MEMC         0.500V         0.007U

  3.001  TARGET       -p
  3.002  SCPI         OUTP:LOAD INF
  3.003  SCPI         FUNC DC
  3.004  SCPI         VOLT:OFFS 10
  3.005  SCPI         OUTP ON

  3.006  SCPI         [@8508]DCV AUTO, RESL7, FILT_ON, FAST_OFF, TWO_WR;GUARD INT;TRG_SRCE EXT[D200]
  3.007  SCPI         [@8508][T30000]X?[I]
  3.008  MEMC         10.000V        0.102U

  4.001  MATH         @8508_conn = 0

  4.002  END
