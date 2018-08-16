#!/usr/bin/env bash
source /home/vagrant/oracle-java7-installer/env.vars
cd /home/vagrant/oracle-java7-installer
echo $JAVA_VERSION > info/VERSION
sed -i "s/JAVA_VERSION=.*/JAVA_VERSION=$JAVA_VERSION/" info/oracle-java7-installer.postinst
info/bin/build-deb
