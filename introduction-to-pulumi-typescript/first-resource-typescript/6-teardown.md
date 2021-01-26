We're all done with our containers at this point, so let's do some cleanup!

## Destroy the containers

Destroying infrastructure with Pulumi is as easy as running `destroy`:

`pulumi destroy`{{execute}}

You'll be prompted for confirmation, hit yes and you'll see the container and image disappear!

## Delete the stack

We won't be using this stack again, so let's go ahead and delete it:

`pulumi stack rm dev`{{execute}}

Again, you'll be prompted for confirmation. Type `dev` into the confirmation box to remove all the reference to this Pulumi stack.
