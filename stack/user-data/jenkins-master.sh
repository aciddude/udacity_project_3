#!/bin/bash

echo "Installing Jenkins"


yum update -y

yum -y install java-1.8.0
yum -y install java-1.8.0-openjdk-devel

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

yum install jenkins -y

service jenkins start

sleep 30


cp /var/lib/jenkins/secrets/initialAdminPassword /home/ec2-user/JenkinsAdminPassword
