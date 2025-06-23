#!/bin/sh
# Source configuration from file
if [ -f "/app/config.txt" ]; then
  # Extract variables from config file, ignoring comments
  set -a
  grep -v "^#" /app/config.txt | grep "=" > /tmp/env.sh
  . /tmp/env.sh
  set +a
fi

# Set default values if not present in config
MAVLINK_SRC=${MAVLINK_SRC:-"tcpout:192.168.2.2:5777"}
VERBOSE=${VERBOSE:-"--verbose"}
RESET=${RESET:-"--reset"}

# Execute with parameters
exec ./mavlink-camera-manager --mavlink=${MAVLINK_SRC} ${VERBOSE} ${RESET} "$@"
