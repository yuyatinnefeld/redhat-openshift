# OpenShift CLI (oc)
The OpenShift client `oc` simplifies working with Kubernetes and OpenShift
clusters, offering a number of advantages over `kubectl` such as easy login,
kube config file management, and access to developer tools. The `kubectl`
binary is included alongside for when strict Kubernetes compliance is necessary.

OC Tool Version: https://mirror.openshift.com/pub/openshift-v3/clients/

## Install OC
    docker build -f Dockerfile-oc --rm -t docker_oc .
    docker run -it --rm docker_oc /bin/sh

## Test OC in Container
    oc version
    oc login [API_URL]
    oc project <projectname>
    oc status
    oc get deployment

## Push OC Image
    docker tag docker_oc yuyatinnefeld/openshift_cli
    docker push yuyatinnefeld/openshift_cli
