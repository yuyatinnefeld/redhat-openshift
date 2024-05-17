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

## Use OC

### Admin User

```bash
# login as sys admin
oc login -u system.admin
```

### Service Account
```bash
SERVICE_ACCOUNT=yuya

# create a service account
oc create sa $SERVICE_ACCOUNT

# or option 2
oc apply -f serviceaccount.yaml

# list service accounts
oc get sa

# check details
oc describe sa $SERVICE_ACCOUNT

# update user role
oc apply -f role.yaml

# check the API Token
oc describe secret yuya-token-kdzn5 -n $SERVICE_ACCOUNT

# use service account with the API Token
oc login --token=eyJhbGciO...

# delete sa
oc delete sa $SERVICE_ACCOUNT
```