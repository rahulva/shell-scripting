#!/bin/bash

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <container_match_keyword> <log_filter_keyword>"
    exit 1
fi

# Assign inputs to variables
CONTAINER_MATCH_KEYWORD="$1"
LOG_FILTER_KEYWORD="$2"

# Find the container name matching the input keyword
CONTAINER_NAME=$(docker ps --format "{{.Names}}" | grep "$CONTAINER_MATCH_KEYWORD")

# Check if a matching container was found
if [ -z "$CONTAINER_NAME" ]; then
    echo "No container found matching keyword: $CONTAINER_MATCH_KEYWORD"
    exit 2
fi

# Display the matching container name
echo "Found container: $CONTAINER_NAME"

# View logs of the container and filter with grep
echo "Filtering logs with keyword: $LOG_FILTER_KEYWORD"
docker logs "$CONTAINER_NAME" 2>&1 | grep --color=always "$LOG_FILTER_KEYWORD"
