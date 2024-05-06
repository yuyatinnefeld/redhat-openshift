# Learning Azure Redhat Openshift (ARO)

## About

## Steps

1. Create ARO Cluster
```bash
./create-aro-cluster.sh
```

2. Connect to the ARO Cluster
```bash
./connect-aro-cluster.sh
```

```bash
open https://console-openshift-console.apps.vwtwulbg.westus2.aroapp.io/
```

3. Deploy K8S in Openshift UI
```bash
k8s/deployment.yaml
k8s/service.yaml
```

4. Integrate HashiCorp Vault 



5. Clean Up
```bash
./deelte-aro-cluster.sh
```