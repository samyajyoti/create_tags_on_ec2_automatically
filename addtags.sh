#!/bin/bash

# Fetch the list of EC2 instance IDs
instance_ids=$(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --region us-east-2 --output text)

# Iterate over each EC2 instance ID
for instance_id in $instance_ids; do
    # Add tags to the EC2 instance using the AWS CLI
    aws ec2 create-tags --resources "$instance_id" --region us-east-2 --tags Key=os_patch,Value=yes 
done

