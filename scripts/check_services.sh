#!/bin/bash
LOG=/opt/automation/logs/services.log
SERVICES=(mongod mariadb docker)
for srv in "${SERVICES[@]}"; do
if ! systemctl is-active --quiet "$srv"; then
echo "$(date): $srv is down, restarting..." >> "$LOG"
systemctl restart "$srv"
fi
done
