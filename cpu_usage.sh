#!/bin/sh
#by Alexandre Jeronimo Correa <ajcorrea@gmail.com>
#13-06-2015
#Based on original script  by Paul Colby (http://colby.id.au)

PREV_TOTAL=0
PREV_IDLE=0

while true; do
  cat /proc/stat | grep '^cpu ' > /tmp/cpu
  TOTAL=`awk '{print $2+$3+$4+$5+$6+$7+$8+$9+$10}' /tmp/cpu` # Get the total CPU statistics.
  IDLE=`awk '{print $5}' /tmp/cpu`                        # Get the idle CPU time.

  # Calculate the CPU usage since we last checked.
  let "DIFF_IDLE=$IDLE-$PREV_IDLE"
  let "DIFF_TOTAL=$TOTAL-$PREV_TOTAL"
  let "DIFF_USAGE=(1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10"
  echo -en "\rCPU: $DIFF_USAGE%  \b\b"

  # Remember the total and idle CPU times for the next check.
  PREV_TOTAL="$TOTAL"
  PREV_IDLE="$IDLE"

  # Wait before checking again.
  sleep 1
done
