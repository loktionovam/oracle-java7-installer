#!/usr/bin/env bash
cd /home/vagrant/oracle-java7-installer/
source env.vars
RELEASE_VERSION=$(expr $(cat info/BUILD_VERSION) - 1)
dpkg -i oracle-java7-installer_$JAVA_VERSION-custom-xenial-r"${RELEASE_VERSION}"_amd64.deb
