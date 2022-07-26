#!/bin/bash

export TF_VAR_TOKEN="***"
export TF_VAR_CLOUD_ID="***"
export TF_VAR_FOLDER_ID="***"
export TF_VAR_ACCESS_KEY="***"
export TF_VAR_SECRET_KEY="***"
cd ./terraform
terraform destroy -auto-approve
cp /dev/null ~/.ssh/known_hosts
