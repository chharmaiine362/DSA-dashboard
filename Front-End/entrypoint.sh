#!/bin/bash

# Wait for data.json to be created in /app/data
while [ ! -f /app/data/data.json ]; do
  sleep 5
done

# Move data.json to /app/src
cp /app/data/data.json /app/src/data.json

# Start the application
npm start