#!/bin/bash

# Install Poetry
pip3 install poetry

# Install system dependencies
apt update
apt install -y libgl-dev libmagic-dev

# Install Docker CE
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up Docker repository based on architecture
if [ "$(uname -m)" = "aarch64" ]; then
    echo 'deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable' | tee /etc/apt/sources.list.d/docker.list > /dev/null
else
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable' | tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

apt update
apt install -y docker-ce docker-ce-cli containerd.io

# Install Python dependencies
poetry install --no-root

# Create and set permissions for elastic data directory
mkdir -p data/elastic
chmod 777 data/elastic

# macOS-specific commands
if [ "$OS" = "darwin" ]; then
    echo "Running on macOS"
    # Add any macOS-specific commands here
fi 