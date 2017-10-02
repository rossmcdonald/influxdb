#!/bin/bash
# This script will build all of the needed containers

TAG="ansible"

function show_usage {
    echo ""
}

function info {
    echo "INFO: $@"
}

function err {
    echo "ERROR: $@"
    exit 1
}

function build_centos_6 {
    info "Building CentOS 6 container..."
    docker build -f Dockerfile_centos_6 -t ${TAG}:centos6 . || err "Could not build CentOS 6 container"
}

function build_centos_7 {
    info "Building CentOS 7 container..."
    docker build -f Dockerfile_centos_7 -t ${TAG}:centos7 . || err "Could not build CentOS 7 container"
}

function build_ubuntu_trusty {
    info "Building Ubuntu Trusty container..."
    docker build -f Dockerfile_ubuntu_trusty -t ${TAG}:ubuntu_trusty . || err "Could not build Ubuntu Trusty container"
}

function build_ubuntu_wily {
    info "Building Ubuntu Wily container..."
    docker build -f Dockerfile_ubuntu_wily -t ${TAG}:ubuntu_wily . || err "Could not build Ubuntu Wily container"
}

function build_ubuntu_xenial {
    info "Building Ubuntu Xenial container..."
    docker build -f Dockerfile_ubuntu_xenial -t ${TAG}:ubuntu_xenial . || err "Could not build Ubuntu Xenial container"
}

function build_opensuse_hearlequin {
    info "Building OpenSUSE Harlequin container..."
    docker build -f Dockerfile_opensuse_harlequin -t ${TAG}:opensuse_harlequin . || err "Could not build OpenSuse Harlequin container"
}
    
function build_opensuse_leap {
    info "Building OpenSUSE Leap container..."
    docker build -f Dockerfile_opensuse_leap -t ${TAG}:opensuse_leap . || err "Could not build OpenSuse Leap container"
}

function build_centos {
    info "Building CentOS containers..."
    build_centos_6
    build_centos_7
}

function build_ubuntu {
    info "Building Ubuntu containers..."
    build_ubuntu_trusty
    build_ubuntu_wily
    build_ubuntu_xenial
}

function build_opensuse {
    info "Building OpenSUSE containers..."
    build_opensuse_hearlequin
    build_opensuse_leap
}

function build_all {
    info "Building All containers..."
    build_centos
    build_ubuntu
    build_opensuse
}

if [ "$1" = "" ]
then
    build_all
elif [ "$1" = "help" ]
then
    show_usage
else
    while [ "$1" != "" ]
    do
        case "$1" in 
            "centos_6") 
                build_centos_6
                ;;
            "centos_7") 
                build_centos_7
                ;;
            "centos") 
                build_centos
                ;;
            "ubuntu_trusty") 
                build_ubuntu_trusty
                ;;
            "ubuntu_wily") 
                build_ubuntu_trusty
                ;;
            "ubuntu_xenial") 
                build_ubuntu_xenial
                ;;
            "ubuntu") 
                build_ubuntu
                ;;
            "opensuse_harlequin") 
                build_opensuse_harlequin
                ;;
            "opensuse_leap") 
                build_opensuse_leap
                ;;
            "opensuse") 
                build_opensuse
                ;;
            "all")
                build_all
                ;;
            *)
                echo "unknown type" 
                ;;
        esac
        shift
    done
fi
