#!/bin/bash

# Create the directory structure
mkdir -p homely-mqtt-addon/rootfs/app

# Copy all homely-mqtt files to the add-on directory
cp -r homely-mqtt/* homely-mqtt-addon/rootfs/app/

echo "Setup complete - files copied to add-on directory"