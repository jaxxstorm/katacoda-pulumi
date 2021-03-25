#!/bin/bash

apt-get update && apt-get install python3-venv -y

# Install pulumi CLI
curl -fsSL https://get.pulumi.com | sh
