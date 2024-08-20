
#!/bin/bash

threshold=80
total=$(grep "MemTotal" /proc/meminfo | awk '{print $2}')
available=$(grep "MemAvailable" /proc/meminfo | awk '{print $2}')
used=$((total - available))
echo "$total"
echo "$available"
echo "$used"
percentage=$(( ($available * 100) / $total ))
echo $percentage%
if [ $percentage -le $threshold ]; then
    echo "The RAM usage is in limit"
else
    echo "The RAM usage is above the threshold"
fi
