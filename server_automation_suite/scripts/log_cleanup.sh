#!/bin/bash

LOG_DIR="/home/deva29/Devops/server_automation_suite/logs"

CLEANUP_LOG="$LOG_DIR/cleanup.log"

RETENTION_DAYS=7

echo "___________________" >> $CLEANUP_LOG
echo "Cleanup Started $(date)" >> $CLEANUP_LOG

if [ ! -d $LOG_DIR ]
then 
	echo "ERROR: Log directory does not exists!" >> $CLEANUP_LOG
	exit 1
fi

OLD_LOG=$(find "$LOG_DIR" -type f -name "*.log" -mtime +$RETENTION_DAYS)

if [ -z "$OLD_LOG" ]
then 
	echo "No old logs found" >> $CLEANUP_LOG
else 
	echo "Deleting old log files:" >> $CLEANUP_LOG

	echo "$OLD_LOG" >> $CLEANUP_LOG

	find "$OLD_LOG" -type f -name "*.log" -mtime +$RETENTION_DAYS -delete

	echo "Old log files deleted successfully!" >> $CLEANUP_LOG

fi 

echo "Cleanup finished" >> $CLEANUP_LOG
echo "______________________________" >> $CLEANUP_LOG

