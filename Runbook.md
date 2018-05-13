# Docker

Everything is run within docker containers to save you having to set up anything locally.

For the aws cli commands run the below command to create the alias for running the commands via the docker container

    alias aws='docker-compose run --rm aws'

_Note that this alias will only last for the terminal session_

# Setting up instances on AWS

## Create Launch Config

    aws autoscaling create-launch-configuration --launch-configuration-name lc1 --instance-type t1.micro --image-id ami-b29cb5cb --key-name simian-army-test

## Create Auto Scaling Group

    aws autoscaling create-auto-scaling-group --auto-scaling-group-name monkey-target --launch-configuration-name lc1 --availability-zones eu-west-1b --min-size 1 --max-size 1

## Inspect auto scaling group

    aws autoscaling describe-auto-scaling-groups --output text

# Army Config

We only want to run the chaos monkey, so go ahead a disable the other services

## Janitor Monkey

src/main/resources/janitor.properties

    simianarmy.janitor.enabled = false

## Conformity Monkey
src/main/resources/conformity.properties

    simianarmy.conformity.enabled = false

src/main/resources/volumeTagging.properties

    simianarmy.volumeTagging.enabled = false


## Add AWS configs

src/main/resources/client.properties

    simianarmy.client.aws.accountKey = {accountKey}
    simianarmy.client.aws.secretKey  = {secretKey}
    simianarmy.client.aws.region = eu-west-1


## Chaos Monkey
src/main/resources/chaos.properties

    simianarmy.chaos.ASG.enabled=false
    simianarmy.chaos.ASG.monkey-target.enabled=true
    simianarmy.chaos.ASG.monkey-target.probability=1.0
