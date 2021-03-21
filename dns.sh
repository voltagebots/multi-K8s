#!/bin/bash

# Tenant ID
tenantId="250ceed6-5bcb-44fc-a063-10b53ee890e7"
# Azure AD App ID
appId="57b4701c-4d1f-4197-9ed9-f1253ae956cb"
# Azure AD App Secret
appSecret="i_YoWhm~6.Ir1fR0we4LQX~wrj3~lIP76V"
# Azure resource group name where your DNS zone is configured
rgName="aks"
# DNS zone name 
zoneName="contoso.xyz" 

myPublicIp = "0.0.0.0"

# Login to Azure
az login --service-principal --tenant $tenantId --username $appId --password $appSecret >/dev/null 2>&1
# Configure default resource group to rgName
az configure --defaults group=$rgName >/dev/null 2>&1
# Create DNS Zone
az network dns zone create -g $rgName -n $zoneName

# Add new record to the record-set
az network dns record-set a add-record -g $rgName -z $zoneName -n www -a $myPublicIp >/dev/null 2>&1