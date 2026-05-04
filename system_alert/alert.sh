#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/auth.log"
ALERT_FILE="alert.log"
THRESHOLD=5


echo "========== ALERT CHECK =========="

# Chech if log file exists
if [[ ! -f "$LOG_FILE" ]]; then
	echo "log  file not found: $LOG_FILE"
	exit 1
fi

# Count sudo entries (last 1 hour)
count=$(grep "sudo" "$LOG_FILE" | tail -n 100 | wc -l)

echo "Total sudo entries: $count"

#Alert condition
if [[ "$count" -gt "$THRESHOLD" ]]; then
	echo "[$(date)] Alert: High sudo activity ($count)" | tee -a "$ALERT_FILE"
else
	echo "System Normal"
fi
