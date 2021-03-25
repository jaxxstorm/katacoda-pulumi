Pulumi has a CLI which is used to interact with a Pulumi program. In order to use Pulumi, you'll need to install it into your environment.

The method you'll use to install Pulumi will depend on your operating system. You can find all the installation instructions [here](https://www.pulumi.com/docs/get-started/install/)

In this interactive tutorial, we'll be using a Linux environment, so we'll use Pulumi's install script to get started.

## Run the script

Run the Pulumi installer script to install the Pulumi CLI

`curl -fsSL https://get.pulumi.com | sh`{{execute}}

This script will detect the latest version of Pulumi and install it into `$HOME/.pulumi/bin`.

If you'd like to examine what the script does, you can view it [here](https://github.com/pulumi/get.pulumi.com/blob/master/dist/install.sh)

Once Pulumi is installed, you'll need to add it to your `$PATH`.

## Add the Pulumi directory to your `$PATH`

Now you've installed the pulumi binary, you'll need to make sure it's available in your `$PATH`.

The easiest way to do that is to restart your current shell:

`exec bash`{{execute}}

Excellent! Now let's see if we can get the current version of our installed binary

## Check the version

Run the `pulumi version` command to ensure we have the right version of pulumi installed:

`pulumi version`{{execute}}

You should see a version returned, like `v2.17.0`. The version number may have changed, as we release new versions of pulumi every 2 weeks!
