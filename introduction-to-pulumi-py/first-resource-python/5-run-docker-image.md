Now we have a Docker image built, we want to _run_ the container so we can view our webserver!

## Run a Container

Let's update our Pulumi program to actually run the container we built:

<pre class="file" data-filename="my-first-app/__main__.py" data-target="append">
container = docker.Container('my-first-app',
  image=image.base_image_name,
  envs=[
    f"LISTEN_PORT=3000"
  ],
  ports=[docker.ContainerPortArgs(
    internal=3000,
    external=3000,
  )])
</pre>

You'll notice here we're actually getting the `baseImageName` from the `image` variable. Every resource in Pulumi has _outputs_. These are values that can be passed to other resources as _inputs_ and they are not known until the Pulumi program is run. 

Let's run `up` to create our Docker container:

`pulumi up`{{execute}}

The program will take a few minutes to run while the container is created.

## Get the Running Container ID

In the previous step, we talked about _Outputs_, which are values from Pulumi resources we don't actually know until they're created.

Sometimes, we want to _export_ these outputs so that we can use them in other programs, like shell scripts.

To do that, we'll use the javascript `export` keyword. Add the following to your Pulumi program

<pre class="file" data-filename="my-first-app/__main__.py" data-target="append">
pulumi.export("containerId", container.id)
</pre>

You'll notice that `id` is a property on the `container` constant, take a look at some of the other outputs from `container` in the vscode intellisense.

Now we've exported the ID, let's rerun our `up` to register it in Pulumi:

`pulumi up`{{execute}}

You can use this value in scripts, let's examine our running container:

`docker stats $(pulumi stack output containerId) --no-stream`{{execute}}

## View your app

You can now view your running application by clicking the `my-first-app` tab next to the terminal pane, or clicking [here](https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/)
