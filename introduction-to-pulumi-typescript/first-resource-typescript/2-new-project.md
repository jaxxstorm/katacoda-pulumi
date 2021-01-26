Now we are logged in, we're ready to create a new Pulumi _project_.,

Project's are directories that contain Pulumi code to define your infrastructure.

We have a handy command in the Pulumi CLI to get started with a new project, so let's get started!

## Create a directory

Create a new directory called `my-first-app` and change into it

```
mkdir my-first-app
cd my-first-app
```{{execute}}

## Create your project

Now, use the `new` command to create a new TypeScript project

`pulumi new typescript`{{execute}}

You'll get some prompts from the Pulumi CLI, it's okay at this stage to accept the default by hitting <kbd>Return</kbd>

This takes care of a few things for us:

  - It creates a Pulumi project with the correct directory structure
  - It installs all the TypeScript dependencies we need inside this Pulumi project
  - It registers this Pulumi project with the Pulumi SaaS

We can examine the contents of this directory too! There are some interesting files here:

* **`index.ts`**: your program's main entrypoint file
* **`package.json`** and **`package-lock.json`**: your project's NPM dependency information
* **`Pulumi.yaml`**: your project's metadata, containing its name and language
* **`tsconfig.json`**: your project's TypeScript settings
* **`node_modules/`**: a directory containing your project's installed NPM dependencies

Run `cat index.ts`{{execute}} to see the contents of your project's empty program:

```typescript
import * as pulumi from "@pulumi/pulumi";
```
