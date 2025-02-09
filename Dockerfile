# Use a lightweight Ubuntu base image
FROM ubuntu:24.04

# Set non-interactive mode for package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget git ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Set Hugo version (update as needed)
ARG HUGO_VERSION=0.142.0

# Download and install the latest Hugo extended version
RUN wget --no-check-certificate -O /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-arm64.deb && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

# Set the working directory to /site
WORKDIR /site

# Initialize a new Hugo site if it doesn’t already exist
RUN hugo new site . || true

# Ensure config.toml exists and configure PaperMod as the theme
RUN echo 'baseURL = "http://localhost:1313/"' > config.toml && \
    echo 'languageCode = "en-us"' >> config.toml && \
    echo 'title = "My Hugo Blog"' >> config.toml && \
    echo 'theme = "PaperMod"' >> config.toml

# Expose Hugo’s default port
EXPOSE 1313

# Start Hugo development server
CMD ["hugo", "server", "--bind", "0.0.0.0"]
