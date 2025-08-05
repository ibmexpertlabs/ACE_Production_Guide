#!/bin/bash

# ACE Production Guide - Prerequisites Installation Script
# This script installs all required tools and dependencies for the ACE Production Guide
# Compatible with RHEL/CentOS/Fedora systems using dnf package manager

echo "=========================================="
echo "ACE Production Guide - Prerequisites Setup"
echo "=========================================="
echo ""

# Check if running as root or with sudo
if [ "$EUID" -eq 0 ]; then
    echo "❌ Please do not run this script as root or with sudo."
    echo "   The script will prompt for sudo when needed."
    exit 1
fi

# Update package lists
echo "📦 Updating package lists..."
sudo dnf -y update

# Add GitHub CLI repository
echo "🔧 Adding GitHub CLI repository..."
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo

# Install GitHub CLI
echo "📥 Installing GitHub CLI..."
sudo dnf -y install gh

# Install jq
echo "📥 Installing jq..."
sudo dnf -y install jq

# Install Development Tools
echo "🛠️ Installing Development Tools..."
sudo dnf -y groupinstall 'Development Tools'

# Install Node.js development module
echo "📥 Installing Node.js development module..."
sudo dnf -y module install nodejs/development

# Install tree
echo "📥 Installing tree..."
sudo dnf -y install tree

# Install TKN command line tool
echo "📥 Installing Tekton CLI (tkn)..."
curl -LO https://github.com/tektoncd/cli/releases/download/v0.21.0/tkn_0.21.0_Linux_x86_64.tar.gz
tar xvzf tkn_0.21.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn
rm tkn_0.21.0_Linux_x86_64.tar.gz

# Install kubeseal
echo "📥 Installing kubeseal..."
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal
chmod +x kubeseal
sudo mv kubeseal /usr/local/bin/
kubeseal --version

echo ""
echo "=========================================="
echo "✅ All packages installed successfully!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Install OpenShift CLI (oc) from: https://docs.openshift.com/container-platform/4.16/cli_reference/openshift_cli/getting-started-cli.html"
echo "2. Verify your installation:"
echo "   - oc version"
echo "   - gh --version"
echo "   - tkn version"
echo "   - kubeseal --version"
echo "   - jq --version"
echo "   - tree --version"
echo "   - node --version"
echo "   - npm --version"
echo ""
echo "For more information, see the ACE Production Guide documentation." 