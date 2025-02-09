# Use a lightweight Ubuntu base image
FROM ubuntu:24.04

# Set non-interactive mode for package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget git ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Set Hugo version
ARG HUGO_VERSION=0.142.0

# Download and install Hugo extended version
RUN wget --no-check-certificate -O /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-arm64.deb && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

# Set the working directory
WORKDIR /site

# Copy the entire project into the container
COPY . .

# Generate static files in the public directory (optional, for production builds)
RUN hugo --destination public

# Expose Hugo’s default port
EXPOSE 1313

# Start Hugo development server with default settings
CMD ["hugo", "server", "--bind", "0.0.0.0"]
