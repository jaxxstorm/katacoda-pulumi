Now we've bootstrapped out Pulumi project, we need to create an app to run inside out Docker container.

We can create our application using the same language as our infrastructure. In this scenario, we're using Python, so let's create a simple Python application that serves a webpage.

## Create an `app` directory

Create a new directory to store our application:

`mkdir app`{{execute}}

## Define our application

Inside our app directory, let's create a small webserver that says "Hello, world!" to us.

<pre class="file" data-filename="my-first-app/app/__main__.py" data-target="replace">
import http.server
import socketserver
from http import HTTPStatus


class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(b'Hello, world!')


httpd = socketserver.TCPServer(('', 3000), Handler)
httpd.serve_forever()
</pre>

Excellent, nice and simple!

## Create Dockerfile

Now we have an application, let's create a `Dockerfile` to be built by our Pulumi program:

<pre class="file" data-filename="my-first-app/app/Dockerfile" data-target="replace">
FROM python:3.8.6-alpine

WORKDIR /app

COPY __main__.py /app

CMD [ "python", "/app/__main__.py" ]
</pre>

Our application is now ready to be built by our Pulumi program!
