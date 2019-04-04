#!/bin/bash

OPENSHIFT_RELEASE="$1"

setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

yum -y install docker
usermod -aG dockerroot vagrant
cat > /etc/docker/daemon.json <<EOF
{
    "group": "dockerroot"
}
EOF
systemctl enable docker
systemctl start docker

# Sourcing common functions
. /vagrant/common.sh
# Fix missing packages for openshift origin 3.11.0
# https://lists.openshift.redhat.com/openshift-archives/dev/2018-November/msg00005.html
if [ "$(version ${OPENSHIFT_RELEASE})" -eq "$(version 3.11)" ]; then
    yum install -y centos-release-openshift-origin311
fi