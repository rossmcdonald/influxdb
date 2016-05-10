#!/bin/bash
# This script will build all of the needed containers

function err {
    echo "ERROR: $@"
    exit 1
}

echo "Building CentOS containers..."
docker build -f Dockerfile_centos_6 -t ansible.influxdb.centos.6:latest . || err "Could not build CentOS 6 container"
docker build -f Dockerfile_centos_7 -t ansible.influxdb.centos.7:latest . || err "Could not build CentOS 6 container"

echo "Building Ubuntu containers..."
docker build -f Dockerfile_ubuntu_trusty -t ansible.influxdb.ubuntu.trusty:latest . || err "Could not build Ubuntu Trusty container"
docker build -f Dockerfile_ubuntu_wily -t ansible.influxdb.ubuntu.wily:latest . || err "Could not build Ubuntu Wily container"
docker build -f Dockerfile_ubuntu_xenial -t ansible.influxdb.ubuntu.xenial:latest . || err "Could not build Ubuntu Xenial container"
