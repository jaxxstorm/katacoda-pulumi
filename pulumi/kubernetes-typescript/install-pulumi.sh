#!/bin/bash

curl -fsSL https://get.pulumi.com | sh
export PATH=$PATH:~/.pulumi/bin
pulumi login --local
