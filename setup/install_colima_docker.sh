#!/bin/bash

# Source the logging functions
source logging.sh "colima_docker"

brew install colima docker docker-credential-helper docker-compose | tee -a "$LOG_FILE" 2>&1