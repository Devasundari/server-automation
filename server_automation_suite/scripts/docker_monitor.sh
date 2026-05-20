#!/bin/bash
LOG_FILE='/home/deva29/Devops/server_automation_suite/logs/docker_monitor.log'

echo "_________________" >> $LOG_FILE
echo "Docker monitoring started $(date):" >> $LOG_FILE

if ! command -v docker &> /dev/null
then
	echo "ERROR: Docker is not found!" >> $LOG_FILE
	exit 1
fi

STOPPED_CONTAINERS=$(docker ps -aq -f status=exited)

if [ -z "$STOPPED_CONTAINERS" ]
then
	echo "No stopped containers found." >> $LOG_FILE
else 
	echo "Stopped containers detected." >> $LOG_FILE

	for CONTAINER in $STOPPED_CONTAINERS
	do
		CONTAINER_NAME=$(docker inspect --format='{{.Name}}' $CONTAINER) 

		echo "Restarting container: $CONTAINER_NAME" >> $LOG_FILE

	        docker start $CONTAINER >> $LOG_FILE 2>&1

		if [ $? -eq 0 ]
		then
			echo "Container restarted successfully: $CONTAINER_NAME" >> $LOG_FILE

		else
			echo "Failed to restart: $CONTAINER_NAME" >> $LOG_FILE

		fi
	done
fi


echo "" >> $LOG_FILE
echo "Currently running containers:" >> $LOG_FILE

docker ps >> $LOG_FILE


echo "" >> $LOG_FILE
echo "Monitoring finished $(date):" >> $LOG_FILE

