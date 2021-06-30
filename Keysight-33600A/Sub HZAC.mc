Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub HZAC
DATE:                  2021-06-30 08:49:13
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       6
NUMBER OF LINES:       85
CONFIGURATION:         Fluke 8508A
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  SCPI         [T20000]*RST[D500]
  1.002  SCPI         [@8508][T20000]*RST[D500]

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

  1.017  DISP         Connect UUT OUTPUT to 8508A INPUT HI and LO using
  1.017  DISP         coax and coax to banana plug adapter.
  1.018  MATH         @8508_conn = 1

  1.019  TARGET       -p

  1.020  SCPI         OUTP:LOAD INF
  1.021  SCPI         FREQ 1000
  1.022  SCPI         VOLT:UNIT VRMS
  1.023  SCPI         VOLT 0.400 VRMS
  1.024  SCPI         VOLT:OFFS 1
  1.025  SCPI         VOLT:RANG:AUTO 0
  1.026  SCPI         VOLT:OFFS 0
  1.027  SCPI         OUTP ON

  1.028  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  1.029  SCPI         [@8508]X?[I]
  1.030  MATH         MEM = MEM*1000
  1.031  MEMC         400.0mV        4.707U
  2.001  SCPI         VOLT:RANG:AUTO 1

  2.002  TARGET       -p
  2.003  SCPI         OUTP:LOAD INF
  2.004  SCPI         VOLT:UNIT VRMS
  2.005  SCPI         APPLy:SIN 1e3,0.400,0[D200]
  2.006  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  2.007  SCPI         [@8508]X?[I]
  2.008  MATH         MEM = MEM*1000
  2.009  MEMC         400.0mV        4.707U

  3.001  TARGET       -p
  3.002  SCPI         OUTP:LOAD INF
  3.003  SCPI         VOLT:UNIT VRMS
  3.004  SCPI         APPLy:SIN 1e3,1,0[D200]
  3.005  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  3.006  SCPI         [@8508]X?[I]
  3.007  MEMC         1.000V         0.010707U

  4.001  TARGET       -p
  4.002  SCPI         OUTP:LOAD INF
  4.003  SCPI         VOLT:UNIT VRMS
  4.004  SCPI         APPLy:SIN 1e3,2.5,0[D200]
  4.005  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  4.006  SCPI         [@8508]X?[I]
  4.007  MEMC         2.500V         0.025707U

  5.001  TARGET       -p
  5.002  SCPI         OUTP:LOAD INF
  5.003  SCPI         VOLT:UNIT VRMS
  5.004  SCPI         APPLy:SIN 1e3,7,0[D200]
  5.005  SCPI         [@8508]ACV AUTO, RESL6, FILT40HZ, TFER_ON, TWO_WR;GUARD INT;TRG_SRCE EXT
  5.006  SCPI         [@8508]X?[I]
  5.007  MEMC         7.000V         0.070707U

  6.001  END
