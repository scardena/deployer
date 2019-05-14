#!/bin/bash

#$(aws ecr get-login --no-include-email --region us-west-2)
#docker build -t onica-app /home/ec2-user/hello-world/
#docker tag onica-app:latest 224221213629.dkr.ecr.us-west-2.amazonaws.com/onica-app:latest
#docker push 224221213629.dkr.ecr.us-west-2.amazonaws.com/onica-app:latest


while read -r remote_ip
do
    ssh -o StrictHostKeyChecking=no -i onica.pem ec2-user@"$remote_ip"  'bash -s' < deployer.sh
done < hosts
