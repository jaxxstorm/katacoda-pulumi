Now we've bootstrapped out Pulumi project, we need to create an app to run inside out Docker container.

We can create our application using the same language as our infrastructure. In this scenario, we're using TypeScript, so let's create a simple TypeScript application that serves a webpage.

## Create an `app` directory

Create a new directory to store our application:

`mkdir app`{{execute}}

## Install application dependencies

Now we'll need to install our application dependencies. We're using TypeScript here like in our Pulumi program, but the dependencies are not shared between the application and infrastructure.

We'll create a `package.json` and install everything we need now:

```
# change into the app directory
cd app
# create a npm package
npm init --yes
# install typescript
npm install typescript
# install expressjs
npm install express @types/express morgan @types/morgan
# back to our root directory
cd ..
```{{execute}}

We've installed [express.js](https://expressjs.com/) here, which we'll use to define a small web application.

## Define our application

Inside our app directory, let's create a small webserver that says "Hello, world!" to us.

<pre class="file" data-filename="my-first-app/app/index.ts" data-target="replace">
import express = require('express');
import morgan = require('morgan');

const app: express.Application = express();

// defines a logger for output
app.use(morgan('combined'))

app.get('/', function(req, res) {
    res.send("Hello, world!");
});

app.listen(3000, function() {
    console.log('Starting app on port 3000!');
})
</pre>


Excellent, nice and simple!

## Create Dockerfile

Now we have an application, let's create a `Dockerfile` to be built by our Pulumi program:

<pre class="file" data-filename="my-first-app/app/Dockerfile" data-target="replace">
FROM node:12

WORKDIR /app

COPY *.json /app/
COPY index.ts /app/

RUN npm install && npm run env -- tsc index.ts
# use dumb-init so docker containers respect signals
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 && chmod +x /usr/local/bin/dumb-init

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD [ "node", "index.js" ]
</pre>

Our application is now ready to be built by our Pulumi program!
