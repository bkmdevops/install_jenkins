#!/bin/bash
yum install java-$1-openjdk-devel -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins-$2 -y
echo "Check the Java version below"
update-alternatives --config java
echo "Change default port 8080 to another one in the config file."
echo "Press any button to go on to the file"
read -s -n 1
vi /usr/lib/systemd/system/jenkins.service
systemctl start jenkins
wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.15/jenkins-plugin-manager-2.12.15.jar
wget http://localhost:8080/jnlpJars/jenkins-cli.jar
