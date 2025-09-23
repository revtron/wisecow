#!/bin/bash

# Path to web server log (change if using Apache or custom path)
LOG_FILE="/home/ubuntu/wisecow/wisecow.log"
REPORT_FILE="/var/log/web_log_report.log"
TS=$(date -Iseconds)

echo "===== Log Report: $TS =====" >> $REPORT_FILE

# 1. Count 404 errors
echo "404 Errors:" >> $REPORT_FILE
grep " 404 " "$LOG_FILE" | wc -l >> $REPORT_FILE

# 2. Most requested pages (top 5)
echo -e "\nTop 5 Requested Pages:" >> $REPORT_FILE
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 >> $REPORT_FILE

# 3. Top 5 IP addresses
echo -e "\nTop 5 IP Addresses:" >> $REPORT_FILE
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 >> $REPORT_FILE

echo -e "\n=========================\n" >> $REPORT_FILE
