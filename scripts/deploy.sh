#!/bin/bash

# Load environment variables from .env
source .env

# Build and run the Docker container with environment variables
docker build -t custom-nagios \
    --build-arg NAGIOSADMIN_USER="$NAGIOS_ADMIN_USER" \
    --build-arg NAGIOSADMIN_PASS="$NAGIOS_ADMIN_PASS" .

docker run -d --name nagios-monitor \
    -p 8080:80 \
    -v "$(pwd)/nagios":/opt/nagios/etc \
    custom-nagios

echo "Nagios deployed at http://localhost:8080"
echo "Login with user '${NAGIOS_ADMIN_USER}' and the specified password."
