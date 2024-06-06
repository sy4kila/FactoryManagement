#!/bin/bash

# Echo a message to ensure the script is running
echo "Starting Firebase Test Lab tests..."

# Decode the service account key file content from the environment variable
echo "$GCLOUD_KEY_FILE_CONTENT" | base64 --decode > gcloud_key_file.json

# Check if the JSON file exists and is not empty
if [ ! -s gcloud_key_file.json ]; then
  echo "Error: gcloud_key_file.json is missing or empty."
  exit 1
fi

# Authenticate using the service account key file
gcloud auth activate-service-account --key-file=gcloud_key_file.json
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

# Cleanup
rm gcloud_key_file.json
