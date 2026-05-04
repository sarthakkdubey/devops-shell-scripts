#!/bin/bash
echo "==========REPORT=========="



echo "==========UPTIME=========="
echo "Uptime of the system is $(uptime)"

echo "==========SYSTEM_LOGS========="
echo "the logs of the system are:"
if [ -f /var/log/auth.log ];then
        grep -a "sudo" /var/log/auth.log | tee -a output.txt
else
        echo "logs not found"
fi

echo "==========TIME_STAMP_OF_THE_SCRIPT=========="
echo "the time of the Script id $(date)"
