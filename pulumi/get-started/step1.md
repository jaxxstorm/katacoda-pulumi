# Download & Install Pulumi

Pulumi supports all major operating systems, and the way you'll install Pulumi depends on which operating system you use. For this particular scenario, we're using Ubuntu Linux, so we'll need to follow the instructions for Linux.

## Run the installer script

`curl -fsSL https://get.pulumi.com | sh`{{execute}}

This should automatically detect your operating system and install Pulumi to `~/.bin/pulumi`

Next, you'll need to make sure this directory is in your `$PATH`. Run the following command:

`export PATH=$PATH:~/.pulumi/bin`{{execute}}

## Check your installation

You should now have a few different programs available to use. Make sure they work as expected!:

`pulumi version`{{execute}}

Should return the version of Pulumi you have installed

`pulumi-language-go --help`{{execute}}

Should return some help text!
