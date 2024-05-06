export LOCATION=westus2
export RESOURCEGROUP=openshiftcluster
export CLUSTER=openshiftcluster

echo "CHECK THE LOGIN INFO"
az aro list-credentials \
  --name $CLUSTER \
  --resource-group $RESOURCEGROUP

az aro show \
    --name $CLUSTER \
    --resource-group $RESOURCEGROUP \
    --query "consoleProfile.url" -o tsv