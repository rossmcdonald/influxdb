#!/bin/bash
# This script will build all of the needed containers

function err {
    echo "ERROR: $@"
    exit 1
}

echo "Building CentOS containers..."
docker build -f Dockerfile_centos_6 -t ansible:centos6 . || err "Could not build CentOS 6 container"
docker build -f Dockerfile_centos_7 -t ansible:centos7 . || err "Could not build CentOS 6 container"

echo "Building Ubuntu containers..."
docker build -f Dockerfile_ubuntu_trusty -t ansible:ubuntu_trusty . || err "Could not build Ubuntu Trusty container"
docker build -f Dockerfile_ubuntu_wily -t ansible:ubuntu_wily . || err "Could not build Ubuntu Wily container"
docker build -f Dockerfile_ubuntu_xenial -t ansible:ubuntu_xenial . || err "Could not build Ubuntu Xenial container"

echo "Building Ubuntu containers..."
docker build -f Dockerfile_opensuse_harlequin -t ansible:opensuse_harlequin . || err "Could not build OpenSuse Harlequin container"
docker build -f Dockerfile_opensuse_leap -t ansible:opensuse_leap . || err "Could not build OpenSuse Leap container"
