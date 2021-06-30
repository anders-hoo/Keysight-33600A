Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Keysight 33600A Verification
DATE:                  2021-06-30 13:23:33
AUTHOR:                Antti Harala
REVISION:              1.1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       172
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
# Add description and notes here. For example describe or list standards,
# manuals or certificates this program is based on.

# Call Preamble
  1.001  CALL         Sub Preamble

# User defined standards. Add if necessary. Adding under subprocedure preferred.
# STD

# First connection messages.
  1.002  DISP         Connect UUT to GPIB bus 1. Wait for UUT to turn on.


# Check device model, BW and channel count
  1.003  SCPI         *IDN?[I$]
  1.004  IF           FIND(MEM2,"33622A",0) >= 1
  1.005  MATH         @model = "33622A"
  1.006  MATH         @BW120 = 1
  1.007  MATH         @channels = 2
  1.008  RESET        OUTP1 OFF;OUTP2 OFF
  1.009  ELSEIF       FIND(MEM2,"33611A",0) >= 1
  1.010  MATH         @model = "33611A"
  1.011  MATH         @BW120 = 0
  1.012  MATH         @channels = 1
  1.013  RESET        OUTP OFF
  1.014  ELSE
  1.015  DISP         UUT model not recognized.
  1.016  END
  1.017  ENDIF

# Main heading.
# If you are creating procedures for multiple instruments (multiple INSTRUMENT: lines in
# file header) you can use PROC() function to call the procedure name and use it in HEAD
# and RSLT functions.
  1.018  MATH         @dev_name = PROC()
  1.019  HEAD         [V @dev_name]
  1.020  RSLT         =[V @dev_name]
  1.021  TARGET       -p

# Set V cal flag
  1.022  MATH         @v_cal = 0

# Set fsmr cal flag
  1.023  MATH         @fsmr_cal = 0

# Set 8508A connection flag
  1.024  MATH         @8508_conn = 0

# Tag.Name = Full Self Test
# Tag.Start = START_ST
# Tag.End = END_ST

  1.025  LABEL        START_ST
  1.026  HEAD         Full Self Test
  1.027  RSLT         =
  1.028  RSLT         =Full Self Test
  1.029  TARGET       -p

  1.030  CALL         Sub Full Self Test

  1.031  LABEL        END_ST

# Tag.Name = Internal Timebase Verification
# Tag.Start = START_TB
# Tag.End = END_TB

  1.032  LABEL        START_TB
  1.033  MATH         @source = 1
  1.034  HEAD         Internal Timebase Verification
  1.035  RSLT         =
  1.036  RSLT         =Internal Timebase Verification
  1.037  TARGET       -p

  1.038  CALL         Sub Timebase Verification

  1.039  LABEL        END_TB

# Tag.Name = AC High-Z Amplitude Verification
# Tag.Start = START_HZAC
# Tag.End = END_HZAC

  1.040  LABEL        START_HZAC
  1.041  MATH         @source = 1
  1.042  CALL         Sub Get Channel Name
  1.043  HEAD         AC High-Z Amplitude Verification[V @current_channel_name]
  1.044  RSLT         =
  1.045  RSLT         =AC High-Z Amplitude Verification[V @current_channel_name]
  1.046  TARGET       -p

  1.047  CALL         Sub HZAC

  1.048  IF           @channels == 2
  1.049  MATH         @source = 2
  1.050  CALL         Sub Get Channel Name
  1.051  HEAD         AC High-Z Amplitude Verification[V @current_channel_name]
  1.052  RSLT         =
  1.053  RSLT         =AC High-Z Amplitude Verification[V @current_channel_name]
  1.054  TARGET       -p

  1.055  CALL         Sub HZAC
  1.056  ENDIF

  1.057  LABEL        END_HZAC

# Tag.Name = DC Offset Voltage Verification
# Tag.Start = START_DCOFF
# Tag.End = END_DCOFF

  1.058  LABEL        START_DCOFF
  1.059  MATH         @source = 1
  1.060  CALL         Sub Get Channel Name
  1.061  HEAD         DC Offset Voltage Verification[V @current_channel_name]
  1.062  RSLT         =
  1.063  RSLT         =DC Offset Voltage Verification[V @current_channel_name]
  1.064  TARGET       -p

  1.065  CALL         Sub DCOFF

  1.066  IF           @channels == 2
  1.067  MATH         @source = 2
  1.068  CALL         Sub Get Channel Name
  1.069  HEAD         DC Offset Voltage Verification[V @current_channel_name]
  1.070  RSLT         =
  1.071  RSLT         =DC Offset Voltage Verification[V @current_channel_name]
  1.072  TARGET       -p

  1.073  CALL         Sub DCOFF
  1.074  ENDIF

  1.075  MATH         @8508_conn = 0

  1.076  LABEL        END_DCOFF

# Tag.Name = Output Flatness Verification
# Tag.Start = START_VFLAT
# Tag.End = END_VFLAT

  1.077  LABEL        START_VFLAT
  1.078  MATH         @source = 1
  1.079  CALL         Sub Get Channel Name
  1.080  HEAD         Output Flatness Verification[V @current_channel_name]
  1.081  RSLT         =
  1.082  RSLT         =Output Flatness Verification[V @current_channel_name]
  1.083  TARGET       -p

  1.084  CALL         Sub VFLAT

  1.085  IF           @channels == 2
  1.086  MATH         @source = 2
  1.087  CALL         Sub Get Channel Name
  1.088  HEAD         Output Flatness Verification[V @current_channel_name]
  1.089  RSLT         =
  1.090  RSLT         =Output Flatness Verification[V @current_channel_name]
  1.091  TARGET       -p

  1.092  CALL         Sub VFLAT
  1.093  ENDIF

  1.094  LABEL        END_VFLAT

  1.095  END
