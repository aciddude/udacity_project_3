#!/bin/bash

export AWS_PROFILE=personal

echo "Building stack"
echo "Run with  plan/apply/destroy/init as a switch"
echo  "---"

if [ $1 == "init" ]
  then
      terraform init ./stack/
      pwd
fi

if [ $1 == "plan" ]
  then
      terraform plan  -var-file=./stack/dev.tfvars ./stack/
      pwd
fi


if [ $1 == "apply" ]
  then
      terraform apply -var-file=./stack/dev.tfvars  -auto-approve ./stack/
      pwd
fi


if [ $1 == "destroy" ]
  then
      terraform destroy -var-file=./stack/dev.tfvars  -auto-approve ./stack/ 
      pwd
fi
