#!/bin/bash
# Checks for USB device changes every 2 seconds. Ctrl-C to stop.

prev=""

while true; do
  current=$(system_profiler SPUSBDataType 2>/dev/null | grep -E "Product ID|Vendor ID|Serial Number")

  if [ "$current" != "$prev" ]; then
    echo "===== change detected at $(date '+%H:%M:%S') ====="
    system_profiler SPUSBDataType 2>/dev/null | grep -B2 -A6 -E "Product ID|Serial Number"
    prev="$current"
  fi

  sleep 2
done