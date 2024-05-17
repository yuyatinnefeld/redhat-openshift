# OpenShift CLI (crc)
CRC brings a minimal OpenShift Container Platform 4 cluster to your local computer. This runtime provides minimal environments for development and testing purposes. CRC is mainly targeted at running on developers' desktops. For other OpenShift Container Platform use cases, such as headless or multi-developer setups, use the full OpenShift installer.

## Customize the VM Memory Size
    # 11.27GB is required for crc start
    colima start --cpu 1 --memory 12 --disk 10

## Install CRC
    docker build -f Dockerfile-crc --rm -t docker_crc .
    docker run -it --rm docker_crc /bin/sh 
    docker run -ti -v /tmp:/tmp --rm docker_crc /bin/sh


## Test CRC in Container
    crc version
    crc setup
    crc start

## Push CRC Image
    docker tag docker_crc yuyatinnefeld/openshift_crc
    docker push yuyatinnefeld/openshift_crc

## Create a Local Cluster

```bash
crc start
```
