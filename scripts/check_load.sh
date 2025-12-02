#!/bin/bash

LOG=/opt/automation/logs/load.log
LOAD=$(awk '{print $1}' /proc/loadavg)
THRESH=4.0

if (( $(echo "$LOAD > $THRESH" | bc -l) )); then
  echo "$(date): High load ($LOAD) - restarting heavy services" >> "$LOG"
  systemctl restart pritunl
  systemctl restart mongod
fi
