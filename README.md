# Learning Azure Redhat Openshift (ARO)

## About
This project provides a structured approach to getting familiar with Azure Red Hat OpenShift (ARO) through hands-on steps and explanations. It emphasizes the usage of the OpenShift CLI (oc) for managing Kubernetes and OpenShift clusters, highlighting its advantages over kubectl and providing clear instructions for installation and usage. The project walks users through essential steps such as creating an ARO cluster, connecting to it, deploying Kubernetes resources via the OpenShift UI, and integrating HashiCorp Vault. Additionally, it offers scripts for cleaning up resources after experimentation. Overall, it serves as a practical guide for learning ARO deployment and management.

## OpenShift CLI (oc)
[Docs](cli-co/README.md)

### Install oc
    docker run -it --rm yuyatinnefeld/openshift_cli /bin/sh

### Use oc
    oc version
    oc login [API_URL]
    oc project <projectname>
    oc status
    oc get deployment

API_URL: Openshift Console > Menu > Copy Login command

Detailed Info: [OpenShift Docs](https://docs.openshift.com/container-platform/4.11/cli_reference/openshift_cli/getting-started-cli.html)

## SCC vs OPA
Security Context Constraints (SCC) and Open Policy Agent (OPA) are both mechanisms used to enforce security policies in OpenShift, but they serve different purposes and operate at different levels of the cluster.

- SCCs are ideal for straightforward, security-focused constraints within OpenShift, while OPA provides a flexible, powerful framework for implementing a wide variety of policies across diverse environments.

## Create Azure Redhat Openshift Cluster

1. Create a Cluster
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

3. Deploy a Simple App in Openshift UI
```bash
k8s/deployment.yaml
k8s/service.yaml
```

4. Build Image


4. Clean Up
```bash
./deelte-aro-cluster.sh
```