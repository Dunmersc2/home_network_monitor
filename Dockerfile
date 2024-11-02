# Use an official Nagios image as a base
FROM jasonrivers/nagios:latest

# Load environment variables
ARG NAGIOSADMIN_USER
ARG NAGIOSADMIN_PASS

# Install necessary tools to configure credentials
RUN apt-get update && apt-get install -y apache2-utils

# Configure Nagios Web UI credentials
RUN htpasswd -bc /opt/nagios/etc/htpasswd.users $NAGIOSADMIN_USER $NAGIOSADMIN_PASS

# Copy custom Nagios templates and plugins
COPY nagios/templates /opt/nagios/etc/templates/
COPY scripts/check_network.sh /usr/local/nagios/libexec/check_network.sh
COPY scripts/init_configs.sh /opt/nagios/init_configs.sh

# Set up permissions and make scripts executable
RUN chmod +x /usr/local/nagios/libexec/check_network.sh /opt/nagios/init_configs.sh

# Expose Nagios Web UI and command ports
EXPOSE 8080 5666

# Start Nagios and run the initialization script
CMD /opt/nagios/init_configs.sh && exec /usr/local/bin/start_nagios
