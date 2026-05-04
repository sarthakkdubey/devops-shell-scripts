# 🚨 Sudo Activity Alert Script

## 📌 Overview

This shell script monitors **sudo activity** from system logs and triggers an alert if usage exceeds a defined threshold. It is useful for detecting unusual or suspicious privilege escalation on a Linux system.

---

## ⚙️ Features

* Checks if the log file exists before processing
* Counts recent `sudo` activity from logs
* Configurable threshold for alerts
* Logs alerts with timestamps
* Appends alerts to a file (`alert.log`)

---

## 🛠️ Requirements

* Linux system
* Bash shell
* Access to system logs (`/var/log/auth.log`)

> ⚠️ Note: You may need `sudo` privileges to access log files.

---

## 🚀 Usage

### 1. Make script executable

```bash
chmod +x alert.sh
```

### 2. Run the script

```bash
./alert.sh
```

---

## 📊 How it Works

1. Checks if `/var/log/auth.log` exists
2. Reads last 100 log entries containing `sudo`
3. Counts occurrences
4. Compares count with threshold
5. If exceeded → logs alert with timestamp

---

## 📁 Output Example

```bash
========== ALERT CHECK ==========
Total sudo entries: 8
[Mon May 6 12:00:00 IST 2026] ALERT: High sudo activity (8)
```

---

## 🔧 Configuration

You can modify these variables in the script:

```bash
LOG_FILE="/var/log/auth.log"
ALERT_FILE="alert.log"
THRESHOLD=5
```

---

## ⚡ Future Improvements

* Email or Slack notifications
* Monitor failed SSH login attempts
* Schedule with cron for automation
* Support multiple log files

---

## 👨‍💻 Author

Sarthak Dubey

