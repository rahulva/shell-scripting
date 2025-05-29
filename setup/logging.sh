#!/bin/bash

# Create logs directory if it doesn't exist
mkdir -p logs

# Set the module name from the argument passed during sourcing
MODULE_NAME="$1"
export LOG_FILE="logs/${MODULE_NAME}_install_$(date +'%Y%m%d_%H%M%S').log"
echo "Writing to file: ${LOG_FILE}"

# Function to log messages
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - ${MODULE_NAME}: $1" | tee -a "$LOG_FILE"
}
