#!/bin/bash

# Docker Installation Script for Debian
# This script installs Docker Engine on Debian-based systems

set -e  # Exit on error

echo "Starting Docker installation..."

# Update package index
echo "Updating package index..."
sudo apt update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl gnupg lsb-release

# Set up Docker's official GPG key
echo "Setting up Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index with Docker repository
echo "Updating package index with Docker repository..."
sudo apt update

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker service
echo "Starting Docker service..."
sudo service docker start

# Verify installation
echo "Verifying Docker installation..."
sudo docker --version

# add user into docker group
sudo usermod -aG docker $USER

echo "Docker installation completed successfully!"
echo "You may want to add your user to the docker group to run Docker without sudo:"
echo "  sudo usermod -aG docker \$USER"
echo "  (Log out and back in for this to take effect)"
