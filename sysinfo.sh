#!/bin/bash

# sysinfo.sh: Provide system information

# get total online memory of system
total_mem=$(lsmem | grep "Total online memory")
# Show date
show_date=$(date)
# Show amount of cpu cores
cpu_cores=$(cat /proc/cpuinfo | grep -m 1 cores)
# Show cpu model name
cpu_name=$(cat /proc/cpuinfo | grep -m 1 "model name")
# Show load avg
load_avg=$(cat /proc/loadavg)

clear
echo "date: $show_date"
echo ""
echo "$total_mem"
echo ""
echo "$cpu_name"
echo ""
echo "$cpu_cores"
echo ""
echo "Load average: $load_avg"

