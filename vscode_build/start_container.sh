#!/bin/bash

IMAGE_NAME="kishmakov/vscode_build:latest"
CONTAINER_NAME="vscode_build"

# Check if the container is already running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Container $CONTAINER_NAME is already running."
    exit 1
fi

# Check if the container exists but is stopped
if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
    echo "Container $CONTAINER_NAME exists but is stopped. Starting it now..."
    docker start $CONTAINER_NAME
    exit 0
fi

# If the container does not exist, run it
echo "Starting new container $CONTAINER_NAME..."
docker run -d \
    --name $CONTAINER_NAME  \
    --mount type=bind,src=/home/kishmakov/Repos/node-related/electron,dst=/workspace/electron \
    --mount type=bind,src=/home/kishmakov/Repos/node-related/depot_tools,dst=/workspace/depot_tools \
    $IMAGE_NAME