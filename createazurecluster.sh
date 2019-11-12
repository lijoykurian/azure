#!/bin/bash

az aks create  --resource-group azuredevops\
   --name fastexpenses \
    --node-count 1 \
    --enable-addons monitoring \
    --generate-ssh-keys

az aks get-credentials --resource-group azuredevops --name fastexpenses

kubectl create clusterrolebinding kubernetes-dashboard -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
az aks browse --resource-group azuredevops --name fastexpenses
