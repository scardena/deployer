#!/bin/bash
echo "Remember to change the ecr url"
$(aws ecr get-login --no-include-email --region us-west-2)
docker pull 224221213629.dkr.ecr.us-west-2.amazonaws.com/onica-app:latest
docker tag 224221213629.dkr.ecr.us-west-2.amazonaws.com/onica-app:latest onica-app:latest
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker run -p 80:3000 -d --mount type=bind,source=/var/appData/,target=/var/app/hostname --name onica onica-app:latest
