#!/bin/bash

export TF_VAR_TOKEN="***"
export TF_VAR_CLOUD_ID="***"
export TF_VAR_FOLDER_ID="***"
export TF_VAR_ACCESS_KEY="***"
export TF_VAR_SECRET_KEY="***"
cd ./terraform
terraform apply -auto-approve
terraform output -json > output.json
sleep 5
export internal_ip_address_app=$(< output.json jq -r '.internal_ip_address_app | .value')
export internal_ip_address_db01=$(< output.json jq -r '.internal_ip_address_db01 | .value')
export internal_ip_address_db02=$(< output.json jq -r '.internal_ip_address_db02 | .value')
export internal_ip_address_gitlab=$(< output.json jq -r '.internal_ip_address_gitlab | .value')
export internal_ip_address_monitoring=$(< output.json jq -r '.internal_ip_address_monitoring | .value')
export internal_ip_address_runner=$(< output.json jq -r '.internal_ip_address_runner | .value')
export internal_ip_address_proxy=$(< output.json jq -r '.internal_ip_address_proxy | .value')
cp /dev/null ~/.ssh/know_hosts
cd ../ansible/
envsubst < "hosts_env.txt" > "hosts"
sleep 5
echo "Поменяй IP в YaCloud или пропиши новый айпи в днс, для продолжения введи 'y', для отмены введи 'n'"
read -p 'Да нет отмена - ' var1
if [[ $var1 == y ]]; then 
    ansible-playbook playbook.yml -i hosts
else 
    echo "Дальше руками запускай"
fi