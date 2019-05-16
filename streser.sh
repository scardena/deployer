#!/bin/bash

while read -r remote_ip
do
    ssh -o StrictHostKeyChecking=no -i onica.pem ec2-user@"$remote_ip"  'stress --cpu 4 --timeout 60s' & 
done < hosts
