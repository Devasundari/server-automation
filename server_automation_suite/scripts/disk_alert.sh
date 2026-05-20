#!/bin/bash

LOG_FILE='/home/deva29/Devops/server_automation_suite/logs/disk_alert.log'

THRESHOLD=80

echo "______________________" >> $LOG_FILE
echo "Disk Monitoring started $(date):" >> $LOG_FILE

df -h | grep '^/dev/' | while read line
do 
	USAGE=$(echo $line | awk '{print $5}' | sed 's/%//')
	PARTITION=$(echo $line | awk '{print $1}')

	if [ $USAGE -ge $THRESHOLD ]
	then 
		echo "WARNING: $PARTITION usage is at ${USAGE}%" >> $LOG_FILE
	else
		echo "$PARTITION usage is healthy at ${USAGE}%" >> $LOG_FILE
	fi 

done

echo "Disk monitoring finished: $(date)" >> $LOG_FILE
echo "____________________" >> $LOG_FILE

