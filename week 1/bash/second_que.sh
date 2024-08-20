#!/bin/bash

echo "Enter the process name:"
read process

if [ $(ps -e | grep "$process" | wc -l) -eq 0 ]; then
  echo "The process is not running"
else
  echo "The process is running"
  process_id=$(ps -e | grep "$process" | awk '{print $1}')
  memory_usage=$(ps -eo pid,%mem | grep "$process_id" | awk '{print $2}')
  echo "Process ID: $process_id"
  echo "Current memory usage: $memory_usage%"
fi
