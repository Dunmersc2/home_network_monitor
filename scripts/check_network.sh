#!/bin/bash
# Usage: check_network.sh <target_ip>
TARGET_IP=$1
ping -c 4 $TARGET_IP > /dev/null

if [ $? -eq 0 ]; then
  echo "Network OK - Target $TARGET_IP is reachable."
  exit 0
else
  echo "Network CRITICAL - Target $TARGET_IP is unreachable."
  exit 2
fi
