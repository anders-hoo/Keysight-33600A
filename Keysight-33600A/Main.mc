Kallab                                                      MET/CAL Procedure
=============================================================================
INSTRUMENT:            Keysight 33611A Verification
INSTRUMENT:            Keysight 33622A Verification
DATE:                  2021-06-29 14:40:51
AUTHOR:                Antti Harala
REVISION:              1.1
ADJUSTMENT THRESHOLD:  70%
NUMBER OF TESTS:       1
NUMBER OF LINES:       125
=============================================================================
 STEP    FSC    RANGE NOMINAL        TOLERANCE     MOD1        MOD2  3  4 CON
# Add description and notes here. For example describe or list standards,
# manuals or certificates this program is based on.

# Call Preamble
  1.001  CALL         Sub Preamble

# User defined standards. Add if necessary. Adding under subprocedure preferred.
# STD

# Reset commands for instruments. Add always if UUT is stimulus instrument.
# Reset command does not require specific address if UUT is alone in bus 1.
# If using stimulus system instruments (standards) that are operated using
# SCPI / IEEE commands, you should add reset commands to the instruments
# WITH a specified address or alias (ie. RESET [@E3634A]OUTP OFF).
  1.002  RESET        OUTP OFF

# Main heading.
# If you are creating procedures for multiple instruments (multiple INSTRUMENT: lines in
# file header) you can use PROC() function to call the procedure name and use it in HEAD
# and RSLT functions.
  1.003  MATH         @dev_name = PROC()
  1.004  HEAD         [V @dev_name]
  1.005  RSLT         =[V @dev_name]
  1.006  TARGET       -p

# First connection messages.
  1.007  DISP         Connect UUT to GPIB bus 1.

  1.008  SCPI         SYSTem:LICense:CATalog?[I$]
  1.009  MATH         MEM = FIND(MEM2, "BW120", 0)
  1.010  IF           MEM >= 1
  1.011  MATH         @BW120 = 1
  1.012  ELSE
  1.013  MATH         @BW120 = 0
  1.014  ENDIF

# Set V cal flag
  1.015  MATH         @v_cal = 0

# Set 8508A connection flag
  1.016  MATH         @8508_conn = 0

# Tag.Name = Full Self Test
# Tag.Start = START_ST
# Tag.End = END_ST

  1.017  LABEL        START_ST
  1.018  HEAD         Full Self Test
  1.019  RSLT         =
  1.020  RSLT         =Full Self Test
  1.021  TARGET       -p

  1.022  CALL         Sub Full Self Test

  1.023  LABEL        END_ST

# Tag.Name = Internal Timebase Verification
# Tag.Start = START_TB
# Tag.End = END_TB

  1.024  LABEL        START_TB
  1.025  HEAD         Internal Timebase Verification
  1.026  RSLT         =
  1.027  RSLT         =Internal Timebase Verification
  1.028  TARGET       -p

  1.029  CALL         Sub Timebase Verification

  1.030  LABEL        END_TB

# Tag.Name = AC High-Z Amplitude Verification
# Tag.Start = START_HZAC
# Tag.End = END_HZAC

  1.031  LABEL        START_HZAC
  1.032  HEAD         AC High-Z Amplitude Verification
  1.033  RSLT         =
  1.034  RSLT         =AC High-Z Amplitude Verification
  1.035  TARGET       -p

  1.036  CALL         Sub HZAC

  1.037  LABEL        END_HZAC

# Tag.Name = DC Offset Voltage Verification
# Tag.Start = START_DCOFF
# Tag.End = END_DCOFF

  1.038  LABEL        START_DCOFF
  1.039  HEAD         DC Offset Voltage Verification
  1.040  RSLT         =
  1.041  RSLT         =DC Offset Voltage Verification
  1.042  TARGET       -p

  1.043  CALL         Sub DCOFF

  1.044  LABEL        END_DCOFF

# Tag.Name = Output Flatness Verification
# Tag.Start = START_VFLAT
# Tag.End = END_VFLAT

  1.045  LABEL        START_VFLAT
  1.046  HEAD         Output Flatness Verification
  1.047  RSLT         =
  1.048  RSLT         =Output Flatness Verification
  1.049  TARGET       -p

  1.050  CALL         Sub VFLAT

  1.051  LABEL        END_VFLAT

  1.052  END
