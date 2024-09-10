#!/bin/bash

# Update the system and install required utilities
sudo yum install yum-utils epel-release -y

# Install Java and wget
sudo yum install java wget -y

# Add Jenkins repository and import its key
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo yum install jenkins -y

# Add Docker repository and install Docker packages
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin --allowerasing

# Install Maven
sudo yum install maven -y

# Enable and start Jenkins and Docker services
sudo systemctl enable jenkins
sudo systemctl start jenkins

sudo systemctl enable docker
sudo systemctl start docker

# Verify installations
echo "Installed versions:"
java -version
wget --version
jenkins --version
docker --version
mvn -version
