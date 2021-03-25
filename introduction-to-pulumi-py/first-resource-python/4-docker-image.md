Now we have all of the building blocks for a Docker application, we can use infrastructure as code to build the Docker a Docker image.

## Install the Pulumi Docker SDK

We'll need to make sure we have the [Pulumi Docker](https://www.pulumi.com/docs/reference/pkg/docker/) SDK installed so we can interact with Docker.

We can take care of this by installing the SDK using [Pip](https://pypi.org/project/pip/) a package manager for Python programs.

We need to install the dependency inside our [virtualenv](https://virtualenv.pypa.io/en/latest/), so first, we'll activate it:

`source venv/bin/activate`{{execute}}

and then, we'll install the pulumi docker SDK

`pip3 install pulumi_docker`{{execute}}

This will install:

  - the Pulumi Python SDK
  - The Pulumi plugin for Docker

## Define your Docker Image

Now, we can define our Docker Image! Inside our Pulumi program, let's populate the `index.ts` with our Docker Image code

<pre class="file" data-filename="my-first-app/__main__.py" data-target="replace">
import pulumi
import pulumi_docker as docker

stack = pulumi.get_stack()
image_name = "my-first-app"

# build our image!
image = docker.Image(image_name,
              build=docker.DockerBuild(context="app"),
              image_name=f"{image_name}:{stack}",
              skip_push=True)
</pre>

We can run the `up` command now to build this image:

`pulumi up`{{execute}}

This will take a few moments, as behind the scenes we're pulling a Docker image and building a new one.

## View your Built Image

We should probably verify that Pulumi did what we asked, for our own peace of mind. We can list the Docker images to verify it actually created an image:

`docker images my-first-app`{{execute}}

Awesome, our first Pulumi resource is a Docker image!
