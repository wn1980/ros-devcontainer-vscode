# Adapted from https://github.com/cruise-automation/webviz

FROM node:10.22 AS builder

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

# clone sourcecode
RUN git clone https://github.com/cruise-automation/webviz.git /app

WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    chromium \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Build static webviz
RUN npm update caniuse-lite browserslist && \
    npm run install-ci && \
    npm run build-static-webviz

# Start again with a clean nginx container
FROM nginx:1-alpine

# For backwards compatibility, patch the server config to change the port
RUN sed -i 's/listen  *80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

# Copy the build products to the web root
COPY --from=builder /app/__static_webviz__ /usr/share/nginx/html
