#!/bin/bash

# Load environment variables from .env if not already set
if [ -f /opt/nagios/.env ]; then
  export $(cat /opt/nagios/.env | xargs)
fi

# Detect Pi's hostname and IP address
PI_HOSTNAME=$(hostname)
PI_IP=$(hostname -I | awk '{print $1}')

# Generate host configuration from template
sed "s/{{HOSTNAME}}/$PI_HOSTNAME/g; s/{{IP_ADDRESS}}/$PI_IP/g" \
    /opt/nagios/etc/templates/host_template.cfg > /opt/nagios/etc/objects/hosts.cfg

# Generate service configuration from template
sed "s/{{HOSTNAME}}/$PI_HOSTNAME/g; s/{{TARGET_IP}}/192.168.1.1/g" \
    /opt/nagios/etc/templates/service_template.cfg > /opt/nagios/etc/objects/services.cfg

echo "Configuration generated for host: $PI_HOSTNAME with IP: $PI_IP"

# Start the Nagios daemon
exec /usr/local/bin/start_nagios
