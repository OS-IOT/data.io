#!/bin/bash

# Check if the network "iot_net" already exists
network_exists=$(docker network ls | grep iot_net)

# If the network does not exist, create it
if [ -z "$network_exists" ]; then
    echo "Creating network 'iot_net' with bridge driver..."
    docker network create --driver bridge iot_net
    echo "'iot_net' network created."
else
    echo "'iot_net' network already exists."
fi