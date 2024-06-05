#!/bin/bash

# Echo a message to ensure the script is running
echo "Starting Firebase Test Lab tests..."

# Path to the service account key file
KEY_FILE_PATH="../secrets/citric-banner-305310-d9650394be93.json"

# Check if the JSON file exists and is not empty
if [ ! -s $KEY_FILE_PATH ]; then
  echo "Error: $KEY_FILE_PATH is missing or empty."
  exit 1
fi

# Authenticate using the service account key file
gcloud auth activate-service-account --key-file=$KEY_FILE_PATH
if [ $? -ne 0 ]; then
  echo "Error: Failed to activate service account."
  exit 1
fi

# Run Firebase Test Lab tests
echo "Running Firebase Test Lab tests..."
# Add your Firebase Test Lab command here

# Check the status of the Firebase Test Lab command
if [ $? -ne 0 ]; then
  echo "Error: Firebase Test Lab tests failed."
  exit 1
fi

echo "Firebase Test Lab tests completed successfully."
