#!/bin/bash

# Download the Go tarball
GO_VERSION="1.21.1"
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz

# Extract the tarball to /usr/local
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz

# Install nano if not already installed
sudo apt update -y
sudo apt install -y nano

# Add Go binary to PATH in ~/.bashrc
BASHRC="$HOME/.bashrc"
if ! grep -q "/usr/local/go/bin" "$BASHRC"; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >> "$BASHRC"
fi

# Apply changes to the current session
source "$BASHRC"

# Verify Go installation
go version

#Install nuclei 
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

cd go/bin

cp nuclei /usr/local/bin

cd

nuclei
