#!/bin/bash
$(aws ecr get-login --no-include-email --region us-east-1)
docker build -t onica-app /home/ec2-user/hello-world/
docker tag onica-app:latest "$1":latest
docker push "$1":latest


while read -r remote_ip
do
    ssh -o StrictHostKeyChecking=no -i onica.pem ec2-user@"$remote_ip"  'bash -s' < helper.sh "$1"
done < hosts
