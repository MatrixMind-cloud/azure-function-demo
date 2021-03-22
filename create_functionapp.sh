#!/bin/bash

# Function app and storage account names must be unique.
storageName=demoappstorageaccount
functionAppName=gvbdemoapp
region=westeurope
resourcegroup=demo.resourcegroup.functions

# Create a resource group.
az group create --name $resourcegroup --location $region

# Create an Azure storage account in the resource group.
az storage account create \
  --name $storageName \
  --location $region \
  --resource-group $resourcegroup \
  --sku Standard_LRS

# Create a serverless function app in the resource group.
az functionapp create \
  --name $functionAppName \
  --storage-account $storageName \
  --consumption-plan-location $region \
  --resource-group $resourcegroup \
  --functions-version 3