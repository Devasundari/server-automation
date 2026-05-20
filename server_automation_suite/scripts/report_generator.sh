#!/bin/bash

# ==========================
# VARIABLES
# ==========================

BASE_DIR="/home/deva29/Devops/server_automation_suite"

REPORT_FILE="/home/deva29/Devops/server_automation_suite/reports/final_report.log"

# ==========================
# START REPORT
# ==========================

echo "======================================" > $REPORT_FILE
echo "SYSTEM REPORT" >> $REPORT_FILE
echo "Generated: $(date)" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE

# ==========================
# RUN ALL SCRIPTS
# ==========================

echo "" >> $REPORT_FILE
echo "Running backup.sh..." >> $REPORT_FILE
bash $BASE_DIR/scripts/backup.sh

echo "Running log_cleanup.sh..." >> $REPORT_FILE
bash $BASE_DIR/scripts/log_cleanup.sh

echo "Running docker_monitor.sh..." >> $REPORT_FILE
bash $BASE_DIR/scripts/docker_monitor.sh

echo "Running server_checker.sh..." >> $REPORT_FILE
bash $BASE_DIR/scripts/server_checker.sh

echo "Running disk_alert.sh..." >> $REPORT_FILE
bash $BASE_DIR/scripts/disk_alert.sh

# ==========================
# COLLECT LOG OUTPUTS
# ==========================

echo "" >> $REPORT_FILE
echo "========== BACKUP LOG ==========" >> $REPORT_FILE
cat $BASE_DIR/logs/backup.log >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "========== CLEANUP LOG ==========" >> $REPORT_FILE
cat $BASE_DIR/logs/cleanup.log >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "========== DOCKER LOG ==========" >> $REPORT_FILE
cat $BASE_DIR/logs/docker_monitor.log >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "========== SERVER CHECK LOG ==========" >> $REPORT_FILE
cat $BASE_DIR/logs/server_check.log >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "========== DISK ALERT LOG ==========" >> $REPORT_FILE
cat $BASE_DIR/logs/disk_alert.log >> $REPORT_FILE

# ==========================
# END REPORT
# ==========================

echo "" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE
echo "MASTER REPORT COMPLETED: $(date)" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE
