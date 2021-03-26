#!/bin/bash
########################################
# Put this on a Server
# run chmod +x deploy_app.sh to make the script executable
# 
# Execute this script:  ./deploy_app.sh ariv3ra/python-circleci-docker:$TAG
# Replace the $TAG with the actual Build Tag you want to deploy
#
########################################

set -e

DOCKER_IMAGE=$1
CONTAINER_NAME=node-test

# Check for arguments
if [[ $# -lt 1 ]] ; then
    echo '[ERROR] You must supply a Docker Image to pull'
    exit 1
fi

echo "Check if container and image exists and delete them"

#Check for running container & stop it before starting a new one
#if [ $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME) == "true" ]; then
#    docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
#    docker rmi $DOCKER_IMAGE
#    else
#        docker rmi $DOCKER_IMAGE
#fi


if [ $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME) == "true" ]; then
    echo $CONTAINER_NAME is Running & docker stop $CONTAINER_NAME & docker rm $CONTAINER_NAME & docker rmi $DOCKER_IMAGE
    else echo "Starting Container Using Docker Image name: $DOCKER_IMAGE" && docker run -d --rm=true -p 3000:3000 --name node-test $DOCKER_IMAGE; 
fi

#if [ $(docker inspect -f '{{.State.Exited}}' $CONTAINER_NAME) = "true" ]; then
#    docker rm $CONTAINER_NAME  && docker rmi $DOCKER_IMAGE
#fi

#echo "Starting Container Using Docker Image name: $DOCKER_IMAGE"

#docker run -d --rm=true -p 3000:3000 --name node-test $DOCKER_IMAGE

docker ps -a