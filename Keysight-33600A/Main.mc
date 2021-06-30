Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Keysight 33600A Verification
DATE:                  2021-06-30 11:55:14
AUTHOR:                Antti Harala
REVISION:              1.1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       175
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

# Reset UUT
  1.025  SCPI         *RST

# Tag.Name = Full Self Test
# Tag.Start = START_ST
# Tag.End = END_ST

  1.026  LABEL        START_ST
  1.027  HEAD         Full Self Test
  1.028  RSLT         =
  1.029  RSLT         =Full Self Test
  1.030  TARGET       -p

  1.031  CALL         Sub Full Self Test

  1.032  LABEL        END_ST

# Tag.Name = Internal Timebase Verification
# Tag.Start = START_TB
# Tag.End = END_TB

  1.033  LABEL        START_TB
  1.034  MATH         @source = 1
  1.035  HEAD         Internal Timebase Verification
  1.036  RSLT         =
  1.037  RSLT         =Internal Timebase Verification
  1.038  TARGET       -p

  1.039  CALL         Sub Timebase Verification

  1.040  LABEL        END_TB

# Tag.Name = AC High-Z Amplitude Verification
# Tag.Start = START_HZAC
# Tag.End = END_HZAC

  1.041  LABEL        START_HZAC
  1.042  MATH         @source = 1
  1.043  CALL         Sub Get Channel Name
  1.044  HEAD         AC High-Z Amplitude Verification[V @current_channel_name]
  1.045  RSLT         =
  1.046  RSLT         =AC High-Z Amplitude Verification[V @current_channel_name]
  1.047  TARGET       -p

  1.048  CALL         Sub HZAC

  1.049  IF           @channels == 2
  1.050  MATH         @source = 2
  1.051  CALL         Sub Get Channel Name
  1.052  HEAD         AC High-Z Amplitude Verification[V @current_channel_name]
  1.053  RSLT         =
  1.054  RSLT         =AC High-Z Amplitude Verification[V @current_channel_name]
  1.055  TARGET       -p

  1.056  CALL         Sub HZAC
  1.057  ENDIF

  1.058  LABEL        END_HZAC

# Tag.Name = DC Offset Voltage Verification
# Tag.Start = START_DCOFF
# Tag.End = END_DCOFF

  1.059  LABEL        START_DCOFF
  1.060  MATH         @source = 1
  1.061  CALL         Sub Get Channel Name
  1.062  HEAD         DC Offset Voltage Verification[V @current_channel_name]
  1.063  RSLT         =
  1.064  RSLT         =DC Offset Voltage Verification[V @current_channel_name]
  1.065  TARGET       -p

  1.066  CALL         Sub DCOFF

  1.067  IF           @channels == 2
  1.068  MATH         @source = 2
  1.069  CALL         Sub Get Channel Name
  1.070  HEAD         DC Offset Voltage Verification[V @current_channel_name]
  1.071  RSLT         =
  1.072  RSLT         =DC Offset Voltage Verification[V @current_channel_name]
  1.073  TARGET       -p

  1.074  CALL         Sub DCOFF
  1.075  ENDIF

  1.076  MATH         @8508_conn = 0

  1.077  LABEL        END_DCOFF

# Tag.Name = Output Flatness Verification
# Tag.Start = START_VFLAT
# Tag.End = END_VFLAT

  1.078  LABEL        START_VFLAT
  1.079  MATH         @source = 1
  1.080  CALL         Sub Get Channel Name
  1.081  HEAD         Output Flatness Verification[V @current_channel_name]
  1.082  RSLT         =
  1.083  RSLT         =Output Flatness Verification[V @current_channel_name]
  1.084  TARGET       -p

  1.085  CALL         Sub VFLAT

  1.086  IF           @channels == 2
  1.087  MATH         @source = 2
  1.088  CALL         Sub Get Channel Name
  1.089  HEAD         Output Flatness Verification[V @current_channel_name]
  1.090  RSLT         =
  1.091  RSLT         =Output Flatness Verification[V @current_channel_name]
  1.092  TARGET       -p

  1.093  CALL         Sub VFLAT
  1.094  ENDIF

  1.095  LABEL        END_VFLAT

  1.096  END
