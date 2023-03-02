#!/bin/bash

your_secret_name=replace_here
your_secret_region=replace_here
your_password_key=replace_here

# Detect the OS
if [[ "$(uname -s)" == "Linux" ]]; then
  if grep -q "Ubuntu" /etc/os-release; then
    OS="ubuntu"
  elif grep -q "CentOS" /etc/os-release; then
    OS="centos"
  else
    echo "Unsupported Linux distribution"
    exit 1
  fi
else
  echo "Unsupported operating system"
  exit 1
fi

# Install required packages based on the OS
if [[ "$OS" == "ubuntu" ]]; then
  sudo apt-get update
  sudo apt-get install -y jq unzip curl
elif [[ "$OS" == "centos" ]]; then
  sudo yum update -y
  sudo yum install -y jq unzip curl
fi

# Install AWS CLI tool
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Fetch and filter the secret
aws secretsmanager get-secret-value --secret-id $your_secret_name --region $your_secret_region | jq ".SecretString" | sed 's/[\]//g' | sed 's/.//' | sed  's/.$//' | jq ".$your_password_key" | sed 's/"//g'
