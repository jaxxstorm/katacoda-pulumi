Now we have a Docker image built, we want to _run_ the container so we can view our webserver!

## Run our container

Let's update our Pulumi program to actually run the container we built:

<pre class="file" data-filename="my-first-app/index.ts" data-target="append">
const container = new docker.Container('my-first-app', {
    image: image.baseImageName,
    ports: [{
        internal: 3000,
        external: 3000,
    }]
})
</pre>

You'll notice here we're actually getting the `baseImageName` from the `image` variable. Every resource in Pulumi has _outputs_. These are values that can be passed to other resources as _inputs_ and they are not known until the Pulumi program is run. 

Let's run `up` to create our Docker container:

`pulumi up`{{execute}}

The program will take a few minutes to run while the container is created.
