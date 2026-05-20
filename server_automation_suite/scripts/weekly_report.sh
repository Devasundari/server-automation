#!/bin/bash

DATE=$(date +%F)

REPORT_FILE="/home/deva29/Devops/server_automation_suite/reports/weekly_reports/weekly_report_$DATE.txt"

echo "======================================" > $REPORT_FILE
echo "WEEKLY SYSTEM REPORT" >> $REPORT_FILE
echo "Generated: $(date)" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "TOTAL WARNINGS THIS WEEK:" >> $REPORT_FILE
grep -r "WARNING"  | wc -l >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "TOTAL FAILURES THIS WEEK:" >> $REPORT_FILE
grep -r "FAILED"  | wc -l >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "TOTAL SERVICE FAILURES:" >> $REPORT_FILE
grep -r "NOT RUNNING"  >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "TOTAL DOCKER RESTARTS:" >> $REPORT_FILE
grep -r "restarted successfully"  | wc -l >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "DISK WARNINGS SUMMARY:" >> $REPORT_FILE
grep -r "WARNING"  >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE
echo "WEEKLY REPORT COMPLETED" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE
