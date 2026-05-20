# 🚀 Server Automation Suite

A modular Linux automation and monitoring project built using Bash scripting.

This project automates:
- system monitoring
- backups
- disk usage alerts
- Docker monitoring
- service health checks
- log cleanup
- weekly/monthly reporting
- cron-based scheduling

---

# 📁 Project Structure

```text
server-automation-suite/
│
├── scripts/
├── logs/
├── backups/
├── reports/
├── config/
├── cron/
└── README.md
```

---

# 🚀 Features

## ✅ Backup Automation
- Compresses important project files
- Stores backups with timestamps
- Generates backup logs

---

## ✅ Log Cleanup
- Removes old log files automatically
- Uses configurable retention days

---

## ✅ Docker Monitoring
- Detects stopped containers
- Logs restart activity

---

## ✅ Server Health Monitoring
Checks:
- uptime
- memory usage
- disk usage
- service status

---

## ✅ Disk Alert Monitoring
- Detects high disk usage
- Generates warning logs
- Configurable threshold support

---

## ✅ Reporting System
Generates:
- weekly reports
- monthly reports
- operational summaries

---

## ✅ Cron Automation
Automates:
- monitoring
- backups
- reporting
- cleanup jobs

---

# 🛠 Technologies Used

- Linux
- Bash Scripting
- Cron Jobs
- Docker
- Systemctl
- Linux Monitoring Commands

---

# 🚀 Scripts Included

| Script | Purpose |
|---|---|
| backup.sh | Backup automation |
| log_cleanup.sh | Old log cleanup |
| docker_monitor.sh | Docker monitoring |
| server_checker.sh | Server health checks |
| disk_alert.sh | Disk usage alerts |
| master_monitor.sh | Central orchestration |
| weekly_report.sh | Weekly operational report |
| monthly_report.sh | Monthly operational report |

---

# ⚙️ Configuration

Configuration file:

```bash
config/app.conf
```

Contains:
- thresholds
- directories
- services
- retention settings

---

# 🚀 How To Run

## Run Individual Scripts

```bash
./backup.sh
./disk_alert.sh
./server_checker.sh
```

---

## Run Master Monitoring

```bash
./master_monitor.sh
```

---

## Generate Reports

```bash
./weekly_report.sh

./monthly_report.sh
```

---

# ⏰ Cron Setup

Install cron jobs:

```bash
crontab cron/automation.cron
```

Verify:

```bash
crontab -l
```

---

# 📊 Concepts Practiced

- Linux Administration
- Bash Automation
- Process Monitoring
- Disk Monitoring
- Docker Monitoring
- Scheduling Automation
- Log Aggregation
- Reporting Systems
- Configuration Management

---

# 🚀 Future Improvements

- Email alerts
- HTML dashboard reports
- Slack/Discord notifications
- Cloud backup integration
- Prometheus integration
- Grafana dashboards

---

# 👨‍💻 Author

Devasundari S

Linux | Bash | DevOps Learning Project
