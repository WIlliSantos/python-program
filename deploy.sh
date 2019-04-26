#!/bin/bash

creation_cluster(){

aws ecs create-cluster --cluster-name teste --profile infopriceMaster --region us-east-1

TASK_DEFINITION=`aws ecs register-task-definition \
    --cli-input-json file://./deploy/calculadora.json \
    --network-mode host \
    --profile infopriceMaster \
    --region us-east-1 \
    | jq '.taskDefinition | .revision'`

aws ecs create-service \
    --cluster teste \
    --service-name calculadora \
    --desired-count 2 \
    --task-definition calculadora:$TASK_DEFINITION \
    --deployment-configuration maximumPercent=100,minimumHealthyPercent=50 \
    --profile infopriceMaster \
    --region us-east-1
}

update_service(){

TASK_DEFINITION=`aws ecs register-task-definition \
    --cli-input-json file://./deploy/calculadora.json \
    --network-mode host \
    --profile infopriceMaster \
    --region us-east-1 \
    | jq '.taskDefinition | .revision'`

aws ecs update-service \
    --cluster teste \
    --service calculadora \
    --desired-count 2 \
    --task-definition calculadora:$TASK_DEFINITION \
    --deployment-configuration maximumPercent=100,minimumHealthyPercent=50 \
    --profile infopriceMaster \
    --region us-east-1
}
creation_cluster