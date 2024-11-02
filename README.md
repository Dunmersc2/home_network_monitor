# Internet Monitoring Dashboard for Raspberry Pi

## Overview

A lightweight internet monitoring tool designed to measure and log internet speeds and network traffic on a Raspberry Pi or Linux-based home server. This setup provides hourly logging of internet speeds and traffic data, with an option for dashboard visualization using Grafana and Prometheus.

This tool is ideal for tracking internet performance over time, identifying slowdowns, and visualizing data in an accessible format.

## Features

- **Speed Monitoring**: Measure download, upload, and ping speeds using Speedtest CLI.
- **Traffic Monitoring**: Log network traffic statistics with vnStat.
- **Logging**: Store data in log files for historical analysis.
- **Dockerized**: Runs in a lightweight Docker container for easy deployment.
- **Optional Dashboard**: Compatible with Grafana and Prometheus for visualization.

## Setup Instructions

### Prerequisites

- A Raspberry Pi or Linux machine
- Docker installed
- Optional: Grafana and Prometheus for dashboarding

### Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Dunmersc2/home_network_monitor.git
   cd home_network_monitor
