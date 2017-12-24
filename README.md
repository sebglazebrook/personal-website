# Overview

This is the repo for my personal website [sebglazebrook.com](sebglazebrook.com)

## Vision

To have a fast, simple to use website that uses cool technologies I like while not letting the tech overpower the product.

## Technical Strategy

The current strategy is to avoid excess and only build what's absolutely necessary.

This has lead to certain decisions that may seem odd and might not scale as the website grows.

- There is currently not "application server" running in production. There is a web server (nginx) that's it.
- All files in production are static, there are no dynamic, in request, generation of server responses.
- There is no database, all files are checked into git and served as static files to the client.

### Frontend Strategy

React is the frontend framework used on the site.

Using React in some respects goes against the technical strategy but it aligns with the vision that the website should be 'fast and simple to use'.

Fast and simple to use means for both the end user and the developer.

React allows me to dev quickly and have a frontend that can grow but remain simple to understand.

The trade off here is that (at this stage) the React framework makes up a large percentage of the total Javascript payload.

## Development

There is a `.aliases` file in the project root directory. This will guide you on how to get the majority of tasks done.
