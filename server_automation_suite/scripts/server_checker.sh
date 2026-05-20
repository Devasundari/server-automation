#!/bin/bash

LOG_FILE='/home/deva29/Devops/server_automation_suite/logs/server_check.log'

echo "________________" >> $LOG_FILE
echo "Sever Check started $(date)" >> $LOG_FILE

echo "System Update:" >> $LOG_FILE
uptime >> $LOG_FILE

echo "" >> $LOG_FILE

echo "Disk usage" >> $LOG_FILE
df -h >> $LOG_FILE

echo "" >> $LOG_FILE

echo "CPU & Memory" >> $LOG_FILE
top -bn1 | head -10 >> $LOG_FILE

echo "" >> $LOG_FILE

SVCS=("ssh" "docker" "cron")

for SVC in "${SVCS[@]}"
do 
	systemctl is-active --quiet $SVC

	if [ $? -eq 0 ]
	then
		echo "$SVC is Running" >> $LOG_FILE
	else
		echo "$SVCis not Running" >> $LOG_FILE
	fi
done

echo "" >> $LOG_FILE
echo "Network check:" >> $LOG_FILE

ping -c 1 google.com >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Server check finished: $(date)" >> $LOG_FILE
echo "_________________________" >> $LOG_FILE
echo "" >> $LOG_FILE

