#!/bin/bash

IMAGE_NAME="kishmakov/vscode_build"

# Get the current date and time in the format yymmdd_hhmm
TAG=$(date +%y%m%d_%H%M)

# Build the Docker image and tag it with the current date and time
docker build -t $IMAGE_NAME:$TAG .

# Also tag the same image as 'latest'
docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:latest

docker push $IMAGE_NAME:$TAG

echo "Docker image built and tagged as $IMAGE_NAME:$TAG and $IMAGE_NAME:latest"