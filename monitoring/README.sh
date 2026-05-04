🖥️ System Monitoring Shell Script

This is a simple Bash script that generates a basic system report including uptime, authentication logs, and a timestamp.

📌 Features
Displays system uptime
Extracts sudo activity from system logs
Saves logs to output.txt
Prints execution timestamp
📂 Script Overview

The script performs the following steps:

Prints a report header
Shows current system uptime
Checks if /var/log/auth.log exists
Filters sudo logs using grep
Saves logs using tee
Displays the current date and time
⚙️ Requirements
Linux-based system
Bash shell
Permission to read /var/log/auth.log (may require sudo)
▶️ How to Run
chmod +x script.sh
./script.sh

If logs are restricted:

sudo ./script.sh
📁 Output
Logs are stored in: output.txt
📝 Notes
Works best on Debian/Ubuntu systems where auth.log is available
On other systems (like CentOS), log file paths may differ
