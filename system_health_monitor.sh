#!/bin/bash

# File: system_health_monitor.sh
# Description: Monitors CPU, memory, disk usage and logs alerts

# Log file path
LOG_FILE="/var/log/system_health.log"

# Timestamp
TS=$(date -Iseconds)

# Thresholds
CPU_THRESHOLD=80     # CPU usage in %
MEM_THRESHOLD=80     # Memory usage in %
DISK_THRESHOLD=85    # Disk usage in %

# Get system metrics
CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print int($2+$4)}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USAGE=$(( 100 * MEM_USED / MEM_TOTAL ))
DISK_USAGE=$(df / | awk 'NR==2 {print int($5)}')

# Log system metrics
echo "[$TS] CPU: $CPU_USAGE% | MEM: $MEM_USAGE% | DISK: $DISK_USAGE%" >> $LOG_FILE

# Check thresholds and log alerts
if (( CPU_USAGE > CPU_THRESHOLD )); then
    echo "[$TS] ALERT: CPU usage above $CPU_THRESHOLD% ($CPU_USAGE%)" >> $LOG_FILE
fi

if (( MEM_USAGE > MEM_THRESHOLD )); then
    echo "[$TS] ALERT: Memory usage above $MEM_THRESHOLD% ($MEM_USAGE%)" >> $LOG_FILE
fi

if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "[$TS] ALERT: Disk usage above $DISK_THRESHOLD% ($DISK_USAGE%)" >> $LOG_FILE
fi

