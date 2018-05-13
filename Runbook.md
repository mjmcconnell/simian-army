# Setting up instances on AWS

## Create Launch Config

    aws autoscaling create-launch-configuration --launch-configuration-name lc1 --instance-type t1.micro --image-id ami-b29cb5cb --key-name simian-army-test

## Create Auto Scaling Group
    aws autoscaling create-auto-scaling-group --auto-scaling-group-name monkey-target --launch-configuration-name lc1 --availability-zones us-west-2a --min-size 1 --max-size 1

## Inspect auto scaling group
    aws autoscaling describe-auto-scaling-groups --output text
