#!/usr/bin/env bash

# Exit on error
set -e

# === CONFIGURABLE VARIABLES ===
STACK_NAME="NetBootcampVPC"
TEMPLATE_FILE="vpc_template.yaml"
REGION="eu-north-1"

# === PARAMETERS ===
VPC_CIDR="10.200.123.0/24"
PUBLIC_SUBNET_CIDR="10.200.123.0/26"
PRIVATE_SUBNET_CIDR="10.200.123.64/26"
AZ="eu-north-1a"
VPC_NAME="MyCPV"

# === DEPLOY STACK ===
echo "Deploying CloudFormation stack: $STACK_NAME"
aws cloudformation deploy \
  --region "$REGION" \
  --stack-name "$STACK_NAME" \
  --template-file "$TEMPLATE_FILE" \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    VpcCidr="$VPC_CIDR" \
    PublicSubnetCidr="$PUBLIC_SUBNET_CIDR" \
    PrivateSubnetCidr="$PRIVATE_SUBNET_CIDR" \
    AvailabilityZone="$AZ" \
    VpcName="$VPC_NAME"

# === OUTPUT ===
echo "Fetching stack outputs..."
aws cloudformation describe-stacks \
  --region "$REGION" \
  --stack-name "$STACK_NAME" \
  --query "Stacks[0].Outputs" \
  --output table
