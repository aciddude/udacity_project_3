#!/bin/bash

echo "Building stack"


terraform plan -var-file=dev.tfvars 
