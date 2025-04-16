#!/bin/bash

# Install the Snowflake Python Connector
echo "Installing Snowflake Python Connector..."
pip3 install snowflake-cli

# Verify installation
echo "Verifying Snowflake Python Connector installation..."
snow --version

# Cleanup (optional, if any temporary files were created)
echo "Cleanup complete."
