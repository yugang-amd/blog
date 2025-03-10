# Alan's Personal Blog

Welcome to [Alan's personal blog](https://alanmond.com) repo, where I share insights, tutorials, and stories on topics I think are interesting.

## Table of Contents

- [About the Blog](#about-the-blog)
- [Features](#features)
- [Deployment](#deployment)
- [Installation Usage](#installation-&-usage)
- [Usage](#usage)

## About the Blog

This blog serves as a platform to also test out multiple technologies and provide tips for folks.

## Features

- **Responsive Design**: Optimized for viewing on devices of all sizes.
- **Fast Performance**: Leveraging Hugo's speed for quick load times and DigitalOcean's App Platfomr.
- **Easy Navigation**: No frills website
- **Continuous Deployment**: See my blog post: https://alanmond.com/posts/how-to-host-a-free-static-website-on-digitalocean/ on how to deploy your own static website for FREE!

## Deployment

The blog is deployed using **DigitalOcean's App Platform**, a fully managed Platform as a Service (PaaS) that simplifies app deployment. With App Platform, code is automatically pulled from the GitHub repository, built, and deployed, ensuring that updates are live within minutes. 

For more details on how to set up App Platform for Hugo sites, refer to the [my blog post](https://alanmond.com/posts/how-to-host-a-free-static-website-on-digitalocean/) on how to do just that.

## Installation

To set up the blog locally, follow these steps:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/alan707/blog.git
   cd blog
   ```

## Usage

1. Run docker-compose

   ```bash
   docker-compose up
   ```

2. Go to the website on your browser:

    ```bash
    Web Server is available at http://localhost:1313/
    ```

3. If you make changes to any files the server will reload and you will see the changes locally.