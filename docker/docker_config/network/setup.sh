#!/bin/bash

# Check if the IOT_NET_CIDR environment variable is set
if [ -z "$IOT_NET_CIDR" ]; then
    echo "Error: The environment variable IOT_NET_CIDR is not set."
    echo "Please set this variable with the desired CIDR for the Docker network."
    exit 1  # Exit script with a status code of 1 (indicating an error)
fi

# Check if the network "iot_net" already exists
network_exists=$(docker network ls | grep iot_net)

# If the network does not exist, create it with the specified CIDR
if [ -z "$network_exists" ]; then
    echo "Creating network 'iot_net' with bridge driver and CIDR $IOT_NET_CIDR..."
    docker network create --driver bridge --subnet $IOT_NET_CIDR iot_net
    echo "'iot_net' network created with subnet $IOT_NET_CIDR."
else
    echo "'iot_net' network already exists."
fi