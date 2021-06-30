Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Sub Get Channel Name
DATE:                  2021-06-30 10:53:47
AUTHOR:                Antti Harala
REVISION:
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       19
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
  1.003  IF           @channels == 2
  1.006  MATH         @current_channel_name = " (Channel " & @source & ")"
  1.005  ELSE
  1.004  MATH         @current_channel_name = ""
  1.007  ENDIF
