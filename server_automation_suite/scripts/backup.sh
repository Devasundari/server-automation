#!/bin/biash
SOURCE_DIR="/home/deva29/Dev/Devops/server_automation_suite/scripts/project-data"
BACKUP_DIR="/home/deva29/Devops/server_automation_suite/backups"
LOG_FILE="/home/deva29/Devops/server_automation_suite/logs/backup.log"

TIMESTAMP=$(date +%F-%H-%M-%S)

BACKUP_NAME="BACKUP-$TIMESTAMP.tar.gz"

echo "======================================" >> $LOG_FILE
echo "Backup Started: $(date)" >> $LOG_FILE

# ==========================
# VALIDATE SOURCE DIRECTORY
# ==========================


if [ ! -d "$SOURCE_DIR" ]
then
    echo "ERROR: Source directory does not exist!" >> $LOG_FILE
    exit 1
fi

# =======================
# CREATE BACKUP
# =======================

tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# ==========================
# # CHECK BACKUP STATUS
# # ========================

if [ $? -eq 0 ]
then
	echo "Backup Successful: $BACKUP_NAME" >> $LOG_FILE
else
	echo "Backup FAILED!" >> $LOG_FILE
	exit 1
fi

# ==========================
# # DELETE OLD BACKUPS
# # Older than 7 days
# # ========================
 

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "Old backups cleaned." >> $LOG_FILE

# # ==========================
# # END LOGGING
# # ==========================
#
echo "Backup Finished: $(date)" >> $LOG_FILE
echo "======================================" >> $LOG_FILE
echo "" >> $LOG_FILE


























