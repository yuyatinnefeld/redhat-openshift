export LOCATION=centralus
export RESOURCEGROUP=openshiftcluster
export CLUSTER=openshiftcluster
export MAINNET_NAME=aro-vnet
export MAINNET_IP=10.0.0.0/22
export M_SUBNET_NAME=master-subnet
export M_SUBNET_IP=10.0.0.0/23
export W_SUBNET_NAME=worker-subnet
export W_SUBNET_IP=10.0.2.0/23

echo "#### CHECK SKU LIMIT FOR AKS ####"
az vm list-skus --location $LOCATION \
  --size Standard_D8s_v3 \
  --all --output table

echo "#### CREATE RESOURCE GROUP ####"
az group create \
  --name $RESOURCEGROUP \
  --location $LOCATION

echo "#### CREATE MAINNET ####"
az network vnet create \
   --resource-group $RESOURCEGROUP \
   --name $MAINNET_NAME \
   --address-prefixes $MAINNET_IP

echo "#### CREATE MASTER SUBNET ####"
az network vnet subnet create \
  --resource-group $RESOURCEGROUP \
  --vnet-name $MAINNET_NAME \
  --name $M_SUBNET_NAME \
   --address-prefixes $M_SUBNET_IP

echo "#### CREATE WORKER SUBNET ####"
az network vnet subnet create \
  --resource-group $RESOURCEGROUP \
  --vnet-name $MAINNET_NAME \
  --name $W_SUBNET_NAME \
  --address-prefixes $W_SUBNET_IP

echo "#### CREATE ARO CLUSTER ####"
az provider register -n Microsoft.RedHatOpenShift --wait

az aro create \
  --resource-group $RESOURCEGROUP \
  --name $CLUSTER \
  --vnet aro-vnet \
  --master-subnet $M_SUBNET_NAME \
  --worker-subnet $W_SUBNET_NAME
