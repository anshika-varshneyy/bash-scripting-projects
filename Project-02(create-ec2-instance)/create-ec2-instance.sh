#!/bin/bash

set -e 

REGION="ap-south-1"
AMI_ID=""   
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-key"
INSTANCE_NAME="My-CLI-EC2"

check_awscli(){
    if ! command -v aws &> /dev/null;then
    echo "Aws CLI is not installed. Please install it first."
    fi
}

install_awscli(){
    echo "Installing aws cli..."
     rm -rf aws awscliv2.zip
    sudo apt-get update -y &> /dev/null
    sudo apt-get install -y unzip curl &> /dev/null
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt-get install -y unzip &> /dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install --update

    aws --version
    rm -rf awscliv2.zip ./aws

    echo "AWS CLI installed/updated successfully"
}

create_ec2_instance() {
    echo "Creating EC2 instance..."

    INSTANCE_ID=$(aws ec2 run-instances \
        --region "$REGION" \
        --image-id "$AMI_ID" \
        --instance-type "$INSTANCE_TYPE" \
        --key-name "$KEY_NAME" \
      ##  --security-group-ids "$SECURITY_GROUP_ID" \
      ##  --subnet-id "$SUBNET_ID" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
        --query "Instances[0].InstanceId" \
        --output text)

    echo "EC2 Instance created with ID: $INSTANCE_ID"
}

wait_for_running() {
    echo "Waiting for EC2 instance to reach RUNNING state..."
    aws ec2 wait instance-running \
        --region "$REGION" \
        --instance-ids "$INSTANCE_ID"

    echo "EC2 instance is now RUNNING"
}

main(){
    check_awscli
    install_awscli
    create_ec2_instance
    wait_for_running
}
main