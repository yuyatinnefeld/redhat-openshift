export LOCATION=centralus
export RESOURCEGROUP=openshiftcluster
export CLUSTER=openshiftcluster
export MAINNET_NAME=aro-vnet
export MAINNET_IP=10.0.0.0/22
export M_SUBNET_NAME=master-subnet
export M_SUBNET_IP=10.0.0.0/23
export W_SUBNET_NAME=worker-subnet
export W_SUBNET_IP=10.0.2.0/23

echo "#### DELETE ARO CLUSTER ####"
az aro delete \
  --resource-group $RESOURCEGROUP \
  --name $CLUSTER

echo "#### DELETE WORKER SUBNET ####"
az network vnet subnet delete \
  --resource-group $RESOURCEGROUP \
  --vnet-name $MAINNET_NAME \
  --name $W_SUBNET_NAME

echo "#### DELETE MASTER SUBNET ####"
az network vnet subnet delete \
  --resource-group $RESOURCEGROUP \
  --vnet-name $MAINNET_NAME \
  --name $M_SUBNET_NAME

echo "#### DELETE MAINNET ####"
az network vnet delete \
   --resource-group $RESOURCEGROUP \
   --name $MAINNET_NAME

echo "#### DELETE RESOURCE GROUP ####"
az group delete --name $RESOURCEGROUP