#!/bin/bash

# install python3 venv
apt-get install python3-venv -y

# Install pulumi CLI
curl -fsSL https://get.pulumi.com | sh

# Reload the shell
exec bash
