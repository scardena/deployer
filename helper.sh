#!/bin/bash

echo "Remember to change the ecr url"
$(aws ecr get-login --no-include-email --region us-east-1)
docker pull "$1":latest
docker tag "$1":latest onica-app:latest
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker run -p 80:3000 -d --mount type=bind,source=/var/appData/,target=/var/app/hostname --name onica onica-app:latest
