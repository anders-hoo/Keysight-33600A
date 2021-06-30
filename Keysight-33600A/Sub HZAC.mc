Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub HZAC
DATE:                  2021-06-30 13:11:15
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       6
NUMBER OF LINES:       97
CONFIGURATION:         Fluke 8508A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  WAIT         [D200]
  1.002  SCPI         *RST
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
  1.014  MATH         @v_cal = 1
  1.015  ELSE
  1.016  MATH         @v_cal = -1
  1.017  ENDIF
  1.018  ENDIF

  1.019  IF           @8508_conn != @source
  1.020  IF           @channels == 2
  1.021  DISP         Connect UUT CHANNEL [V @source] to 8508A INPUT HI and LO using
  1.021  DISP         coax and coax to banana plug adapter.
  1.022  ELSE
  1.023  DISP         Connect UUT OUTPUT to 8508A INPUT HI and LO using
  1.023  DISP         coax and coax to banana plug adapter.
  1.024  ENDIF
  1.025  ENDIF
  1.026  MATH         @8508_conn = @source

  1.027  TARGET       -p

  1.028  IF           @channels == 2
  1.029  SCPI         DISPlay:FOCus CH[V @source]
  1.030  ENDIF

  1.031  SCPI         OUTP[V @source]:LOAD INF
  1.032  SCPI         SOURCE[V @source]:FREQ 1000
  1.033  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  1.034  SCPI         SOURCE[V @source]:VOLT 0.400 VRMS
  1.035  SCPI         SOURCE[V @source]:VOLT:OFFS 1
  1.036  SCPI         SOURCE[V @source]:VOLT:RANG:AUTO 0
  1.037  SCPI         SOURCE[V @source]:VOLT:OFFS 0
  1.038  SCPI         OUTP[V @source] ON

  1.039  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  1.040  SCPI         [@8508]X?[I]
  1.041  MATH         MEM = MEM*1000
  1.042  MEMC         400.0mV        4.707U
  2.001  SCPI         SOURCE[V @source]:VOLT:RANG:AUTO 1

  2.002  TARGET       -p
  2.003  SCPI         OUTP[V @source]:LOAD INF
  2.004  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  2.005  SCPI         SOURCE[V @source]:APPLy:SIN 1e3,0.400 VRMS,0[D200]
  2.006  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  2.007  SCPI         [@8508]X?[I]
  2.008  MATH         MEM = MEM*1000
  2.009  MEMC         400.0mV        4.707U

  3.001  TARGET       -p
  3.002  SCPI         OUTP[V @source]:LOAD INF
  3.003  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  3.004  SCPI         SOURCE[V @source]:APPLy:SIN 1e3,1 VRMS,0[D200]
  3.005  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  3.006  SCPI         [@8508]X?[I]
  3.007  MEMC         1.000V         0.010707U

  4.001  TARGET       -p
  4.002  SCPI         OUTP[V @source]:LOAD INF
  4.003  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  4.004  SCPI         SOURCE[V @source]:APPLy:SIN 1e3,2.5 VRMS,0[D200]
  4.005  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  4.006  SCPI         [@8508]X?[I]
  4.007  MEMC         2.500V         0.025707U

  5.001  TARGET       -p
  5.002  SCPI         OUTP[V @source]:LOAD INF
  5.003  SCPI         SOURCE[V @source]:VOLT:UNIT VRMS
  5.004  SCPI         SOURCE[V @source]:APPLy:SIN 1e3,7 VRMS,0[D200]
  5.005  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  5.006  SCPI         [@8508]X?[I]
  5.007  MEMC         7.000V         0.070707U

  6.001  END
