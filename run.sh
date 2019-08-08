#!/bin/bash

export AWS_PROFILE=personal

echo "Building stack"
echo "Run with  plan/apply/destroy/init as a switch"
echo  "---"

if [ $1 == "init" ]
  then
      terraform init -var-file=dev.tfvars
      pwd
fi

if [ $1 == "plan" ]
  then
      terraform plan -var-file=dev.tfvars
      pwd
fi


if [ $1 == "apply" ]
  then
      terraform apply -var-file=dev.tfvars  -auto-approve
      pwd
fi


if [ $1 == "destroy" ]
  then
      terraform destroy -var-file=dev.tfvars  -auto-approve
      pwd
fi
