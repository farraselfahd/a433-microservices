#!/bin/bash

# build image [app-name:tag]
docker build -t ghcr.io/farraselfahd/karsajobs-ui:latest . &

PIDS[0]=$!

# login to Github Container Registry using Personal Access Token (which already saved in Env)
echo $GHCR_PAT | docker login ghcr.io -u farraselfahd --password-stdin

# push image to Github Container Registry
wait ${PIDS[0]}
docker push ghcr.io/farraselfahd/karsajobs-ui:latest 
