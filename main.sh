#!/bin/bash

# Function to print colored logs
print_log() {
 echo -e "\e[1;34mEtrixs-script | $1\e[0m"

}

# Check OS and install packages accordingly
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
else
    OS=$(uname -s)
fi

case "$OS" in
    "Alpine Linux")
        print_log "Installing Python..."
        apk add python3
        print_log "Python installed successfully!"
        
        print_log "Installing Node.js..."
        apk add nodejs npm
        print_log "Node.js installed successfully!"
        
        print_log "Installing OpenJDK..."
        apk add openjdk18
        print_log "OpenJDK installed successfully!"
        
        print_log "Installing Git..."
        apk add git
        print_log "Git installed successfully!"
        
        print_log "Installing other essentials..."
        apk add bash curl wget
        print_log "Other essentials installed successfully!"
        ;;
    "Ubuntu" | "Debian GNU/Linux")
        print_log "Installing Python..."
        apt-get update && apt-get install -y python3
        print_log "Python installed successfully!"
        
        print_log "Installing Node.js..."
        apt-get install -y nodejs npm
        print_log "Node.js installed successfully!"
        
        print_log "Installing OpenJDK..."
        apt-get install -y default-jdk
        print_log "OpenJDK installed successfully!"
        
        print_log "Installing Git..."
        apt-get install -y git
        print_log "Git installed successfully!"
        
        print_log "Installing other essentials..."
        apt-get install -y bash curl wget
        print_log "Other essentials installed successfully!"
        ;;
    "CentOS Linux")
        print_log "Installing Python..."
        yum install -y python3
        print_log "Python installed successfully!"
        
        print_log "Installing Node.js..."
        curl -sL https://rpm.nodesource.com/setup_14.x | bash -
        yum install -y nodejs
        print_log "Node.js installed successfully!"
        
        print_log "Installing OpenJDK..."
        yum install -y java-11-openjdk-devel
        print_log "OpenJDK installed successfully!"
        
        print_log "Installing Git..."
        yum install -y git
        print_log "Git installed successfully!"
        
        print_log "Installing other essentials..."
        yum install -y bash curl wget
        print_log "Other essentials installed successfully!"
        ;;
    *)
        print_log "Unsupported OS: $OS"
        exit 1
        ;;
esac

print_log "script installed all dependency successfully!"

