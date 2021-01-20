Now we have all of the building blocks for a Docker application, we can use infrastructure as code to build the Docker a Docker image.

## Install the Pulumi Docker SDK

We'll need to make sure we have the [Pulumi Docker](https://www.pulumi.com/docs/reference/pkg/docker/) SDK installed so we can interact with Docker.

We can take care of this by installing the SDK using [NPM](https://www.npmjs.com/) a package manager for NodeJS programs.

`npm install @pulumi/docker`{{execute}}

This will install:

  - the Pulumi NodeJS SDK including TypeScript types
  - The Pulumi plugin for Docker

## Define your Docker Image

Now, we can define our Docker Image! Inside our Pulumi program, let's populate the `index.ts` with our Docker Image code

<pre class="file" data-filename="my-first-app/index.ts" data-target="replace">
import * as pulumi from "@pulumi/pulumi";
import * as docker from "@pulumi/docker";

const imageName = 'my-first-app'

const image = new docker.Image('my-first-app', {
    build: './app',
    imageName: `${imageName}:${stack}`,
    skipPush: true,
})
</pre>

We can run the `up` command now to build this image:

`pulumi up`{{execute}}

This will take a few moments, as behind the scenes we're pulling a Docker image and building a new one.

## View your Built Image

We should probably verify that Pulumi did what we asked, for our own peace of mind. We can list the Docker images to verify it actually created an image:

`docker images`{{execute}}

Awesome, our first Pulumi resource is a Docker image!
