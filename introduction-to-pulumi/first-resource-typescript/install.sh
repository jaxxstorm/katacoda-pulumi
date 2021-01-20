#!/bin/bash

# Install pulumi CLI
curl -fsSL https://get.pulumi.com | sh
# Reload shell to get into bash
exec bash
# Prompt for login
pulumi login
