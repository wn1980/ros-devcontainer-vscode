# Copyright (c) 2020-present, GM Cruise LLC
#
# This source code is licensed under the Apache License, Version 2.0,
# found in the LICENSE file in the root directory of this source tree.
# You may not use this file except in compliance with the License.

# This is a static build of just the Webviz application.
# This container is published at https://hub.docker.com/r/cruise/webviz.

FROM node:10.22 AS builder

# clone sourcecode
RUN git clone https://github.com/cruise-automation/webviz.git /app

WORKDIR /app

# Install dependencies
RUN npm run install-ci

# Build static webviz
RUN npm run build-static-webviz

# Start again with a clean nginx container
FROM nginx:1-alpine

# For backwards compatibility, patch the server config to change the port
RUN sed -i 's/listen  *80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

# Copy the build products to the web root
COPY --from=builder /app/__static_webviz__ /usr/share/nginx/html