#!/bin/bash

echo "1-minute CPU utilization: $(awk '{print $1}' /proc/loadavg)"
echo "5-minute CPU utilization: $(awk '{print $2}' /proc/loadavg)"
echo "15-minute CPU utilization: $(awk '{print $3}' /proc/loadavg)"

echo "Total CPU utilization: $(top -b -n 1| awk '/Cpu/ {print $2}')%"
echo "Total memory utilization: $(free -m | awk '/Mem/ {print $3 / $2 * 100 "%"}')"
echo "Disk usage:" $(df / | grep / | awk '{print $5}')
