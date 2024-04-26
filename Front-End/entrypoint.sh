#!/bin/bash

# Wait for data.json to be created in /app/data
while [ ! -f /app/data/data.json ]; do
  sleep 10
done

# Move data.json to /app/src
if [ ! -f /app/src/data.json ]; then
  mv /app/data/data.json /app/src/data.json
fi

# Start the application
npm start