#!/bin/bash

# Docker Installation Script for Ubuntu
# This script installs Docker Engine on Ubuntu-based systems

set -e  # Exit on error

echo "Starting Docker installation for Ubuntu..."

# Remove any old Docker installations
echo "Removing old Docker installations if any..."
sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# Update package index
echo "Updating package index..."
sudo apt update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl gnupg lsb-release

# Set up Docker's official GPG key
echo "Setting up Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Set up the Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index with Docker repository
echo "Updating package index with Docker repository..."
sudo apt update

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Verify installation
echo "Verifying Docker installation..."
sudo docker --version
sudo docker run hello-world

echo ""
echo "============================================"
echo "Docker installation completed successfully!"
echo "============================================"
echo ""
echo "Optional: Add your user to the docker group to run Docker without sudo:"
echo "  sudo usermod -aG docker \$USER"
echo "  newgrp docker"
echo ""
echo "Or log out and back in for the group change to take effect."
