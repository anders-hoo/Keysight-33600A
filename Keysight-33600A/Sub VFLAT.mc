Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub VFLAT
DATE:                  2021-06-30 11:46:49
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       45
NUMBER OF LINES:       298
CONFIGURATION:         Fluke 5790A
CONFIGURATION:         FSMR26-N
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.001  WAIT         [D200]
  1.002  IF           @source == 1
  1.003  SCPI         [@5790][T20000]*RST;INPUT WBND; EXTRIG 1
  1.004  ENDIF
  1.005  DISP         Connect UUT OUTPUT to 5790B WIDEBAND INPUT.

  1.027  IF           @channels == 2
  1.028  SCPI         DISPlay:FOCus CH[V @source]
  1.029  ENDIF

  1.006  MATH         @v_ampl = 0.354
  1.007  CALL         Sub 5790 Ref

  1.008  TARGET       -p
  1.009  MATH         @freq = 100e3
  1.010  CALL         Sub 5790 Measurement
  1.011  MEMC         0.00dB         0.10U

  2.001  TARGET       -p
  2.002  MATH         @freq = 500e3
  2.003  CALL         Sub 5790 Measurement
  2.004  MEMC         0.00dB         0.10U

  3.001  TARGET       -p
  3.002  MATH         @freq = 1e6
  3.003  CALL         Sub 5790 Measurement
  3.004  MEMC         0.00dB         0.10U

  4.001  TARGET       -p
  4.002  MATH         @freq = 5e6
  4.003  CALL         Sub 5790 Measurement
  4.004  MEMC         0.00dB         0.10U

  5.001  TARGET       -p
  5.002  MATH         @freq = 10e6
  5.003  CALL         Sub 5790 Measurement
  5.004  MEMC         0.00dB         0.20U

  6.001  TARGET       -p
  6.002  MATH         @freq = 20e6
  6.003  CALL         Sub 5790 Measurement
  6.004  MEMC         0.00dB         0.20U

  7.001  TARGET       -p
  7.002  MATH         @freq = 30e6
  7.003  CALL         Sub 5790 Measurement
  7.004  MEMC         0.00dB         0.20U

  8.001  MATH         @v_ampl = 1.414
  8.002  CALL         Sub 5790 Ref

  8.003  TARGET       -p
  8.004  MATH         @freq = 100e3
  8.005  CALL         Sub 5790 Measurement
  8.006  MEMC         0.00dB         0.10U

  9.001  TARGET       -p
  9.002  MATH         @freq = 500e3
  9.003  CALL         Sub 5790 Measurement
  9.004  MEMC         0.00dB         0.10U

 10.001  TARGET       -p
 10.002  MATH         @freq = 1e6
 10.003  CALL         Sub 5790 Measurement
 10.004  MEMC         0.00dB         0.10U

 11.001  TARGET       -p
 11.002  MATH         @freq = 5e6
 11.003  CALL         Sub 5790 Measurement
 11.004  MEMC         0.00dB         0.10U

 12.001  TARGET       -p
 12.002  MATH         @freq = 10e6
 12.003  CALL         Sub 5790 Measurement
 12.004  MEMC         0.00dB         0.25U

 13.001  TARGET       -p
 13.002  MATH         @freq = 20e6
 13.003  CALL         Sub 5790 Measurement
 13.004  MEMC         0.00dB         0.25U

 14.001  TARGET       -p
 14.002  MATH         @freq = 30e6
 14.003  CALL         Sub 5790 Measurement
 14.004  MEMC         0.00dB         0.25U

 15.001  MATH         @v_ampl = 2.828
 15.002  CALL         Sub 5790 Ref

 15.003  TARGET       -p
 15.004  MATH         @freq = 100e3
 15.005  CALL         Sub 5790 Measurement
 15.006  MEMC         0.00dB         0.10U

 16.001  TARGET       -p
 16.002  MATH         @freq = 500e3
 16.003  CALL         Sub 5790 Measurement
 16.004  MEMC         0.00dB         0.10U

 17.001  TARGET       -p
 17.002  MATH         @freq = 1e6
 17.003  CALL         Sub 5790 Measurement
 17.004  MEMC         0.00dB         0.10U

 18.001  TARGET       -p
 18.002  MATH         @freq = 5e6
 18.003  CALL         Sub 5790 Measurement
 18.004  MEMC         0.00dB         0.10U

 19.001  TARGET       -p
 19.002  MATH         @freq = 10e6
 19.003  CALL         Sub 5790 Measurement
 19.004  MEMC         0.00dB         0.25U

 20.001  TARGET       -p
 20.002  MATH         @freq = 20e6
 20.003  CALL         Sub 5790 Measurement
 20.004  MEMC         0.00dB         0.25U

 21.001  TARGET       -p
 21.002  MATH         @freq = 30e6
 21.003  CALL         Sub 5790 Measurement
 21.004  MEMC         0.00dB         0.25U

 22.001  IF           @source == 1 || @fsmr_cal == 0
 22.002  SCPI         [@FSMR]*RST
 22.003  SCPI         [@FSMR]ROSC:SOUR INT
 22.004  SCPI         [@FSMR]SYSTem:DISPlay:UPDate ON
 22.005  SCPI         [@FSMR]INIT:CONT ON

 22.006  DISP         Connect NRP-Z51 Power Sensor to FSMR.
 22.006  DISP         Leave the power sensor head unconnected
 22.006  DISP         for power sensor zero.

 22.007  SCPI         [@FSMR]INST:SEL MREC
 22.008  SCPI         [@FSMR]SENS:PMET:STAT ON
 22.009  SCPI         [@FSMR]CAL:PMET:ZERO:AUTO ONCE;*WAI
 22.010  MATH         @fsmr_cal = 1
 22.011  ENDIF

 22.012  IF           @channels == 2
 22.013  DISP         Connect the NRP-Z51 Power Sensor to UUT CHANNEL [V @source].
 22.014  ELSE
 22.015  DISP         Connect the NRP-Z51 Power Sensor to UUT OUTPUT.
 22.016  ENDIF

 22.017  MATH         @v_ampl = 0.354
 22.018  CALL         Sub FSMR Ref

 22.019  TARGET       -p
 22.020  MATH         @freq = 40e6
 22.021  CALL         Sub FSMR Measurement
 22.022  MEMC         0.00dB         0.20U

 23.001  TARGET       -p
 23.002  MATH         @freq = 50e6
 23.003  CALL         Sub FSMR Measurement
 23.004  MEMC         0.00dB         0.20U

 24.001  TARGET       -p
 24.002  MATH         @freq = 60e6
 24.003  CALL         Sub FSMR Measurement
 24.004  MEMC         0.00dB         0.20U

 25.001  TARGET       -p
 25.002  MATH         @freq = 70e6
 25.003  CALL         Sub FSMR Measurement
 25.004  MEMC         0.00dB         0.30U

 26.001  TARGET       -p
 26.002  MATH         @freq = 80e6
 26.003  CALL         Sub FSMR Measurement
 26.004  MEMC         0.00dB         0.30U

 27.001  IF           @BW120 == 1

 27.002  TARGET       -p
 27.003  MATH         @freq = 90e6
 27.004  CALL         Sub FSMR Measurement
 27.005  MEMC         0.00dB         0.40U

 28.001  TARGET       -p
 28.002  MATH         @freq = 100e6
 28.003  CALL         Sub FSMR Measurement
 28.004  MEMC         0.00dB         0.40U

 29.001  TARGET       -p
 29.002  MATH         @freq = 110e6
 29.003  CALL         Sub FSMR Measurement
 29.004  MEMC         0.00dB         0.40U

 30.001  TARGET       -p
 30.002  MATH         @freq = 120e6
 30.003  CALL         Sub FSMR Measurement
 30.004  MEMC         0.00dB         0.40U

 31.001  ENDIF

 31.002  MATH         @v_ampl = 1.414
 31.003  CALL         Sub FSMR Ref

 31.004  TARGET       -p
 31.005  MATH         @freq = 40e6
 31.006  CALL         Sub FSMR Measurement
 31.007  MEMC         0.00dB         0.25U

 32.001  TARGET       -p
 32.002  MATH         @freq = 50e6
 32.003  CALL         Sub FSMR Measurement
 32.004  MEMC         0.00dB         0.25U

 33.001  TARGET       -p
 33.002  MATH         @freq = 60e6
 33.003  CALL         Sub FSMR Measurement
 33.004  MEMC         0.00dB         0.25U

 34.001  TARGET       -p
 34.002  MATH         @freq = 70e6
 34.003  CALL         Sub FSMR Measurement
 34.004  MEMC         0.00dB         0.40U

 35.001  TARGET       -p
 35.002  MATH         @freq = 80e6
 35.003  CALL         Sub FSMR Measurement
 35.004  MEMC         0.00dB         0.40U

 36.001  IF           @BW120 == 1

 36.002  TARGET       -p
 36.003  MATH         @freq = 90e6
 36.004  CALL         Sub FSMR Measurement
 36.005  MEMC         0.00dB         0.50U

 37.001  TARGET       -p
 37.002  MATH         @freq = 100e6
 37.003  CALL         Sub FSMR Measurement
 37.004  MEMC         0.00dB         0.50U

 38.001  TARGET       -p
 38.002  MATH         @freq = 110e6
 38.003  CALL         Sub FSMR Measurement
 38.004  MEMC         0.00dB         0.50U

 39.001  TARGET       -p
 39.002  MATH         @freq = 120e6
 39.003  CALL         Sub FSMR Measurement
 39.004  MEMC         0.00dB         0.50U

 40.001  ENDIF

 40.002  IF           @channels == 2
 40.003  DISP         Add Model HP 8491B 10 dB (S/N 17871) Attenuator
 40.003  DISP         to the power sensor head. Reconnect the power
 40.003  DISP         sensor with the attenuator to UUT CHANNEL [V @source].
 40.004  ELSE
 40.005  DISP         Add Model HP 8491B 10 dB (S/N 17871) Attenuator
 40.005  DISP         to the power sensor head. Reconnect the power
 40.005  DISP         sensor with the attenuator to UUT OUTPUT.
 40.006  ENDIF

 40.007  MATH         @v_ampl = 2.828
 40.008  CALL         Sub FSMR Ref

 40.009  TARGET       -p
 40.010  MATH         @freq = 40e6
 40.011  CALL         Sub FSMR Measurement
 40.012  MEMC         0.00dB         0.25U

 41.001  TARGET       -p
 41.002  MATH         @freq = 50e6
 41.003  CALL         Sub FSMR Measurement
 41.004  MEMC         0.00dB         0.25U

 42.001  TARGET       -p
 42.002  MATH         @freq = 60e6
 42.003  CALL         Sub FSMR Measurement
 42.004  MEMC         0.00dB         0.25U

 43.001  TARGET       -p
 43.002  MATH         @freq = 70e6
 43.003  CALL         Sub FSMR Measurement
 43.004  MEMC         0.00dB         0.40U

 44.001  TARGET       -p
 44.002  MATH         @freq = 80e6
 44.003  CALL         Sub FSMR Measurement
 44.004  MEMC         0.00dB         0.40U

 45.001  END
