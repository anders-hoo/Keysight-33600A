Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub VFLAT
DATE:                  2021-06-29 15:25:25
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       45
NUMBER OF LINES:       314
CONFIGURATION:         Fluke 5790A
CONFIGURATION:         FSMR26-N
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  CALL         Sub Preamble
  1.002  WAIT         [D200]
  1.003  SCPI         [T20000]*RST[D200]
  1.004  SCPI         [@5790][T20000]*RST;INPUT WBND; EXTRIG 1

  1.005  DISP         Connect UUT OUTPUT to 5790B WIDEBAND INPUT.

  1.006  MATH         @v_ampl = 0.354
  1.007  CALL         Sub 5790 Ref

  1.008  TARGET       -p
  1.009  MATH         @freq = 100e3
  1.010  CALL         Sub 5790 Measurement
  1.011  MEMC         0.00dBm        0.10U

  2.001  TARGET       -p
  2.002  MATH         @freq = 500e3
  2.003  CALL         Sub 5790 Measurement
  2.004  MEMC         0.00dBm        0.10U

  3.001  TARGET       -p
  3.002  MATH         @freq = 1e6
  3.003  CALL         Sub 5790 Measurement
  3.004  MEMC         0.00dBm        0.10U

  4.001  TARGET       -p
  4.002  MATH         @freq = 5e6
  4.003  CALL         Sub 5790 Measurement
  4.004  MEMC         0.00dBm        0.10U

  5.001  TARGET       -p
  5.002  MATH         @freq = 10e6
  5.003  CALL         Sub 5790 Measurement
  5.004  MEMC         0.00dBm        0.20U

  6.001  TARGET       -p
  6.002  MATH         @freq = 20e6
  6.003  CALL         Sub 5790 Measurement
  6.004  MEMC         0.00dBm        0.20U

  7.001  TARGET       -p
  7.002  MATH         @freq = 30e6
  7.003  CALL         Sub 5790 Measurement
  7.004  MEMC         0.00dBm        0.20U
  8.001  END

## JATKA TÄSTÄ

  8.002  TARGET       -p
  8.003  MATH         @freq = 40e6
  8.004  CALL         Sub FSMR Measurement
  8.005  MEMC         0.00dBm        0.20U

  9.001  TARGET       -p
  9.002  MATH         @freq = 50e6
  9.003  CALL         Sub FSMR Measurement
  9.004  MEMC         0.00dBm        0.20U

 10.001  TARGET       -p
 10.002  MATH         @freq = 60e6
 10.003  CALL         Sub FSMR Measurement
 10.004  MEMC         0.00dBm        0.20U

 11.001  TARGET       -p
 11.002  MATH         @freq = 70e6
 11.003  CALL         Sub FSMR Measurement
 11.004  MEMC         0.00dBm        0.30U

 12.001  TARGET       -p
 12.002  MATH         @freq = 80e6
 12.003  CALL         Sub FSMR Measurement
 12.004  MEMC         0.00dBm        0.30U

 13.001  IF           @BW120 == 1

 13.002  TARGET       -p
 13.003  MATH         @freq = 90e6
 13.004  CALL         Sub FSMR Measurement
 13.005  MEMC         0.00dBm        0.40U

 14.001  TARGET       -p
 14.002  MATH         @freq = 100e6
 14.003  CALL         Sub FSMR Measurement
 14.004  MEMC         0.00dBm        0.40U

 15.001  TARGET       -p
 15.002  MATH         @freq = 110e6
 15.003  CALL         Sub FSMR Measurement
 15.004  MEMC         0.00dBm        0.40U

 16.001  TARGET       -p
 16.002  MATH         @freq = 120e6
 16.003  CALL         Sub FSMR Measurement
 16.004  MEMC         0.00dBm        0.40U

 17.001  ENDIF

 17.002  HEAD         4 Vpp Flatness Verification

 17.003  RSLT         =
 17.004  RSLT         =4 Vpp Flatness Verification
 17.005  MATH         @v_ampl = 1.414
 17.006  MATH         @freq = 1e3
 17.007  SCPI         OUTP:LOAD 50
 17.008  SCPI         VOLT:UNIT VRMS
 17.009  SCPI         APPLy:SIN [V @freq],[V @v_ampl],0[D1000]
 17.010  SCPI         [@FSMR]INIT;*WAI
 17.011  SCPI         [@FSMR]:CALC:PMET:REL:AUTO ONCE
 17.012  SCPI         [@FSMR]:CALC:PMET:REL?[I]
 17.013  MATH         @ref_1k = MEM

 17.014  TARGET       -p
 17.015  MATH         @freq = 100e3
 17.016  CALL         Sub FSMR Measurement
 17.017  MATH         MEM = MEM/@ref_1k*100
 17.018  MEMC         0.00pct        1.15U

 18.001  TARGET       -p
 18.002  MATH         @freq = 500e3
 18.003  CALL         Sub FSMR Measurement
 18.004  MATH         MEM = MEM/@ref_1k*100
 18.005  MEMC         0.00pct        1.15U

 19.001  TARGET       -p
 19.002  MATH         @freq = 1e6
 19.003  CALL         Sub FSMR Measurement
 19.004  MATH         MEM = MEM/@ref_1k*100
 19.005  MEMC         0.00pct        1.15U

 20.001  TARGET       -p
 20.002  MATH         @freq = 5e6
 20.003  CALL         Sub FSMR Measurement
 20.004  MATH         MEM = MEM/@ref_1k*100
 20.005  MEMC         0.00pct        1.15U

 21.001  TARGET       -p
 21.002  MATH         @freq = 10e6
 21.003  CALL         Sub FSMR Measurement
 21.004  MATH         MEM = MEM/@ref_1k*100
 21.005  MEMC         0.00pct        2.92U

 22.001  TARGET       -p
 22.002  MATH         @freq = 20e6
 22.003  CALL         Sub FSMR Measurement
 22.004  MATH         MEM = MEM/@ref_1k*100
 22.005  MEMC         0.00pct        2.92U

 23.001  TARGET       -p
 23.002  MATH         @freq = 30e6
 23.003  CALL         Sub FSMR Measurement
 23.004  MEMC         0.00dBm        0.25U

 24.001  TARGET       -p
 24.002  MATH         @freq = 40e6
 24.003  CALL         Sub FSMR Measurement
 24.004  MEMC         0.00dBm        0.25U

 25.001  TARGET       -p
 25.002  MATH         @freq = 50e6
 25.003  CALL         Sub FSMR Measurement
 25.004  MEMC         0.00dBm        0.25U

 26.001  TARGET       -p
 26.002  MATH         @freq = 60e6
 26.003  CALL         Sub FSMR Measurement
 26.004  MEMC         0.00dBm        0.25U

 27.001  TARGET       -p
 27.002  MATH         @freq = 70e6
 27.003  CALL         Sub FSMR Measurement
 27.004  MEMC         0.00dBm        0.40U

 28.001  TARGET       -p
 28.002  MATH         @freq = 80e6
 28.003  CALL         Sub FSMR Measurement
 28.004  MEMC         0.00dBm        0.40U

 29.001  IF           @BW120 == 1

 29.002  TARGET       -p
 29.003  MATH         @freq = 90e6
 29.004  CALL         Sub FSMR Measurement
 29.005  MEMC         0.00dBm        0.50U

 30.001  TARGET       -p
 30.002  MATH         @freq = 100e6
 30.003  CALL         Sub FSMR Measurement
 30.004  MEMC         0.00dBm        0.50U

 31.001  TARGET       -p
 31.002  MATH         @freq = 110e6
 31.003  CALL         Sub FSMR Measurement
 31.004  MEMC         0.00dBm        0.50U

 32.001  TARGET       -p
 32.002  MATH         @freq = 120e6
 32.003  CALL         Sub FSMR Measurement
 32.004  MEMC         0.00dBm        0.50U

 33.001  ENDIF

 33.002  HEAD         8 Vpp Flatness Verification

 33.003  DISP         Add 10 dB attenuator between the Power Sensor and
 33.003  DISP         UUT OUTPUT.

 33.004  RSLT         =
 33.005  RSLT         =8 Vpp Flatness Verification
 33.006  MATH         @v_ampl = 2.828
 33.007  MATH         @freq = 1e3
 33.008  SCPI         OUTP:LOAD 50
 33.009  SCPI         VOLT:UNIT VRMS
 33.010  SCPI         APPLy:SIN [V @freq],[V @v_ampl],0[D1000]
 33.011  SCPI         [@FSMR]INIT;*WAI
 33.012  SCPI         [@FSMR]:CALC:PMET:REL:AUTO ONCE
 33.013  SCPI         [@FSMR]:CALC:PMET:REL?[I]
 33.014  MATH         @ref_1k = MEM

 33.015  TARGET       -p
 33.016  MATH         @freq = 100e3
 33.017  CALL         Sub FSMR Measurement
 33.018  MATH         MEM = MEM/@ref_1k*100
 33.019  MEMC         0.00pct        1.15U

 34.001  TARGET       -p
 34.002  MATH         @freq = 500e3
 34.003  CALL         Sub FSMR Measurement
 34.004  MATH         MEM = MEM/@ref_1k*100
 34.005  MEMC         0.00pct        1.15U

 35.001  TARGET       -p
 35.002  MATH         @freq = 1e6
 35.003  CALL         Sub FSMR Measurement
 35.004  MATH         MEM = MEM/@ref_1k*100
 35.005  MEMC         0.00pct        1.15U

 36.001  TARGET       -p
 36.002  MATH         @freq = 5e6
 36.003  CALL         Sub FSMR Measurement
 36.004  MATH         MEM = MEM/@ref_1k*100
 36.005  MEMC         0.00pct        1.15U

 37.001  TARGET       -p
 37.002  MATH         @freq = 10e6
 37.003  CALL         Sub FSMR Measurement
 37.004  MATH         MEM = MEM/@ref_1k*100
 37.005  MEMC         0.00pct        2.92U

 38.001  TARGET       -p
 38.002  MATH         @freq = 20e6
 38.003  CALL         Sub FSMR Measurement
 38.004  MATH         MEM = MEM/@ref_1k*100
 38.005  MEMC         0.00pct        2.92U

 39.001  TARGET       -p
 39.002  MATH         @freq = 30e6
 39.003  CALL         Sub FSMR Measurement
 39.004  MEMC         0.00dBm        0.25U

 40.001  TARGET       -p
 40.002  MATH         @freq = 40e6
 40.003  CALL         Sub FSMR Measurement
 40.004  MEMC         0.00dBm        0.25U

 41.001  TARGET       -p
 41.002  MATH         @freq = 50e6
 41.003  CALL         Sub FSMR Measurement
 41.004  MEMC         0.00dBm        0.25U

 42.001  TARGET       -p
 42.002  MATH         @freq = 60e6
 42.003  CALL         Sub FSMR Measurement
 42.004  MEMC         0.00dBm        0.25U

 43.001  TARGET       -p
 43.002  MATH         @freq = 70e6
 43.003  CALL         Sub FSMR Measurement
 43.004  MEMC         0.00dBm        0.40U

 44.001  TARGET       -p
 44.002  MATH         @freq = 80e6
 44.003  CALL         Sub FSMR Measurement
 44.004  MEMC         0.00dBm        0.40U

 45.001  END

 45.002  HEAD         Power Sensor Zero

 45.003  DISP         Connect NRP-Z51 Power Sensor to FSMR26-N.
 45.003  DISP         Leave the Sensor head unconnected for Power Sensor Zero.

 45.004  SCPI         [@FSMR]*RST
 45.005  SCPI         [@FSMR]ROSC:SOUR INT
 45.006  SCPI         [@FSMR]INIT:CONT ON
 45.007  SCPI         [@FSMR]SYSTem:DISPlay:UPDate ON

 45.008  SCPI         [@FSMR]INST:SEL MREC
 45.009  SCPI         [@FSMR]SENS:PMET:STAT ON
 45.010  SCPI         [@FSMR]:CALC:PMET:REL:STAT OFF
 45.011  SCPI         [@FSMR]CAL:PMET:ZERO:AUTO ONCE;*WAI
 45.012  SCPI         [@FSMR]INIT:CONT OFF

 45.013  DISP         Connect the NRP-Z51 Power Sensor to UUT OUTPUT.
