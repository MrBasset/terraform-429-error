#!/bin/bash

## You'll need to have logged into AZ-CLI with az login and set your correct account with az account set -s <sub>

# create tf state resource group
az group create -l uksouth -n tf429-tfstate-rg

# create tf state storage account
az storage account create -n tf429tfstate001 -g tf429-tfstate-rg --https-only true

# create tf state blob container
az storage container create -n tf429-terraform-state --account-name tf429tfstate001