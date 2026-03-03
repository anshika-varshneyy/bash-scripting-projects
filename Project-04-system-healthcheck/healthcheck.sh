#!/bin/bash

echo "==============================="
echo "   SYSTEM HEALTH CHECK"
echo "==============================="
echo ""


echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'
echo ""


echo "Memory Usage:"
free | awk '/Mem:/ {printf("Used: %.2f%%\n", $3/$2 * 100)}'
echo ""


echo "Disk Usage:"
df -h / | awk 'NR==2 {print "Root Usage: " $5}'
echo ""


echo "Checking SSH Service:"
if systemctl is-active --quiet ssh; then
    echo "SSH is running"
else
    echo "SSH is NOT running"
fi
echo ""

echo "Network Status:"
if ping -c 1 google.com &> /dev/null; then
    echo "Internet is reachable"
else
    echo "No Internet connectivity"
fi