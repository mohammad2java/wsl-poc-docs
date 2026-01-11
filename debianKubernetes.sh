#!/bin/bash

# Minikube Installation Script for Debian
# This script installs Docker, Minikube, and kubectl

set -e  # Exit on any error

echo "======================================="
echo "Minikube Installation Script for Debian"
echo "======================================="
echo ""


# install wget client
sudo apt install wget

# Download and install Minikube v1.37.0 for Intel 64-bit
wget https://github.com/kubernetes/minikube/releases/download/v1.37.0/minikube_1.37.0-0_amd64.deb
sudo dpkg -i minikube_1.37.0-0_amd64.deb

# Verify installation
minikube version

# Install kubectl 
sudo apt install kubectl

