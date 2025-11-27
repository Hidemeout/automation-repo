#!/bin/bash
# Проверяет статус pritunl и рестартует если нужно
LOG=/opt/automation/logs/pritunl.log
if ! systemctl is-active --quiet pritunl; then
echo "$(date): Pritunl is down, restarting..." >> "$LOG"
systemctl restart pritunl
fi
