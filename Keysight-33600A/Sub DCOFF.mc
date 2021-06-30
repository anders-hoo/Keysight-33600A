Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub DCOFF
DATE:                  2021-06-30 11:39:24
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       4
NUMBER OF LINES:       73
CONFIGURATION:         Fluke 8508A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  WAIT         [D200]
  1.002  IF           @v_cal == 0
  1.003  OPBR         Do you want to Zero Fluke 8508 AC and DC Voltage?
  1.004  IF           MEM1 == 1
  1.005  SCPI         [@8508]DCV AUTO, FILT_OFF, RESL7, FAST_ON, TWO_WR;GUARD INT
  1.006  DISP         Connect Fluke 4W short to 8508A.
  1.007  WAIT         -a -t 15 DCV Zero: Please wait for emf dissapation.
  1.008  SCPI         [@8508][T120000]MZERO?
  1.009  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT
  1.010  WAIT         -a -t 15 ACV Zero: Please wait for emf dissapation.
  1.011  SCPI         [@8508][T120000]MZERO?
  1.012  DISP         Remove the 4W short.
  1.013  MATH         @v_cal = 1
  1.014  ELSE
  1.015  MATH         @v_cal = -1
  1.016  ENDIF
  1.017  ENDIF

  1.018  IF           @8508_conn != @source
  1.019  IF           @channels == 2
  1.020  DISP         Connect UUT CHANNEL [V @source] to 8508A INPUT HI and LO using
  1.020  DISP         coax and coax to banana plug adapter.
  1.021  ELSE
  1.022  DISP         Connect UUT OUTPUT to 8508A INPUT HI and LO using
  1.022  DISP         coax and coax to banana plug adapter.
  1.023  ENDIF
  1.024  ENDIF
  1.025  MATH         @8508_conn = @source

  1.027  IF           @channels == 2
  1.028  SCPI         DISPlay:FOCus CH[V @source]
  1.029  ENDIF

  1.026  TARGET       -p
  1.027  SCPI         OUTP[V @source]:LOAD INF
  1.028  SCPI         SOURCE[V @source]:FUNC DC
  1.029  SCPI         SOURCE[V @source]:VOLT:OFFS 0
  1.030  SCPI         OUTP[V @source] ON

  1.031  SCPI         [@8508]DCV AUTO, RESL7, FILT_ON, FAST_OFF, TWO_WR;GUARD INT;TRG_SRCE EXT[D200]
  1.032  SCPI         [@8508][T30000]X?[I]
  1.033  MEMC         0.000V         0.002U

  2.001  TARGET       -p
  2.002  SCPI         OUTP[V @source]:LOAD INF
  2.003  SCPI         SOURCE[V @source]:FUNC DC
  2.004  SCPI         SOURCE[V @source]:VOLT:OFFS 0.500
  2.005  SCPI         OUTP[V @source] ON

  2.006  SCPI         [@8508]DCV AUTO, RESL7, FILT_ON, FAST_OFF, TWO_WR;GUARD INT;TRG_SRCE EXT[D200]
  2.007  SCPI         [@8508][T30000]X?[I]
  2.008  MEMC         0.500V         0.007U

  3.001  TARGET       -p
  3.002  SCPI         OUTP[V @source]:LOAD INF
  3.003  SCPI         SOURCE[V @source]:FUNC DC
  3.004  SCPI         SOURCE[V @source]:VOLT:OFFS 10
  3.005  SCPI         OUTP[V @source] ON

  3.006  SCPI         [@8508]DCV AUTO, RESL7, FILT_ON, FAST_OFF, TWO_WR;GUARD INT;TRG_SRCE EXT[D200]
  3.007  SCPI         [@8508][T30000]X?[I]
  3.008  MEMC         10.000V        0.102U

  4.001  END
