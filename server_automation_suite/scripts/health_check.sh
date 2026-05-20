
LOG_FILE="health.log"

echo "Health check: $(date)" > $LOG_FILE

echo "CPU usage:" > $LOG_FILE
top -bn1 | grep "Cpu" > $LOG_FILE

echo "Memory usage:" > $LOG_FILE
free -h > $LOG_FILE

echo "Disk free space:" > $LOG_FILE
df -h > $LOG_FILE

echo "Disk usage:" > $LOG_FILE
du -sh . > $LOG_FILE

echo "Uptime:" > $LOG_FILE
uptime > $LOG_FILE
