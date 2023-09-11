#!/bin/bash

# build image [app-name:tag]
docker build -t item-app:v1 . &

PIDS[0]=$!

# show local images
wait ${PIDS[0]} && docker images

# tag image item-app:v1, [registry/namespace/app-name:tag]
wait ${PIDS[0]}
docker tag item-app:v1 ghcr.io/farraselfahd/item-app:v1 &

PIDS[1]=$!

# login to Github Container Registry using Personal Access Token (which already saved in Env)
echo $CR_PAT | docker login ghcr.io -u farraselfahd --password-stdin

# push image to Github Container Registry
wait ${PIDS[1]} 
docker push ghcr.io/farraselfahd/item-app:v1
