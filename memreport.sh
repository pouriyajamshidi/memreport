#!/bin/bash

set -eou

if [ -z "$1" ]; then
  echo "[-] Please provide a process name."
  exit 1
fi

process_name="$1"

previous_usage=0

while true; do
  sleep 1s
  mem_usage=$(ps aux | grep -v grep | grep -i "$process_name" | awk '{print $6}')
  mem_usage_mb=$(echo "$mem_usage / 1000" | bc)
  current_date=$(date "+%Y-%m-%d %H:%M:%S")

  if [[ $mem_usage_mb -gt $previous_usage ]]; then
    echo "$current_date -> $mem_usage_mb MB" >> "${process_name}_memreport.log"
    previous_usage="$mem_usage_mb"
  else
    res_diff=$((previous_usage - mem_usage_mb))

    # for when the memory goes back down
    if [[ $res_diff -gt 1 ]]; then
      echo "$current_date -> $mem_usage_mb MB" >> "${process_name}_memreport.log"
      previous_usage="$mem_usage_mb"
    fi
  fi
done