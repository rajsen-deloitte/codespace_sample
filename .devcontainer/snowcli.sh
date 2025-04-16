#!/bin/bash

# Define the Snowflake CLI version to install
export snowcli_version=3.6.0

# Update the package list and install prerequisites
echo "Updating package list and installing prerequisites..."
sudo apt-get update
sudo apt-get install -y curl apt-transport-https gnupg

# Download the correct Snowflake CLI Debian package
echo "Downloading Snowflake CLI version ${snowcli_version}..."
curl --create-dirs -o /tmp/downloads/snowflake-cli-${snowcli_version}.x86_64.deb \
  https://sfc-repo.snowflakecomputing.com/snowflake-cli/linux_x86_64/${snowcli_version}/snowflake-cli-${snowcli_version}.x86_64.deb

# Install the Debian package
echo "Installing Snowflake CLI..."
sudo dpkg -i /tmp/downloads/snowflake-cli-${snowcli_version}.x86_64.deb

# Fix any missing dependencies
echo "Fixing missing dependencies..."
sudo apt-get install -f -y

# Verify installation
echo "Verifying Snowflake CLI installation..."
snow --version

# Cleanup
echo "Cleaning up temporary files..."
rm /tmp/downloads/snowflake-cli_${snowcli_version}_amd64.deb