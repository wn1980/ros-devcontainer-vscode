#!/usr/bin/env bash

set -e

VERSION=3.10.2

# install code-server
RUN wget https://github.com/cdr/code-server/releases/download/v${VERSION}/code-server_3.10.2_$(dpkg --print-architecture).deb && \
    dpkg -i code-server_${VERSION}_$(dpkg --print-architecture).deb

sudo apt update && sudo apt install -y \
    supervisor \
    wget

echo -e "\n===================Configuring code-server ...\n================="

sudo cat > "/etc/supervisor/conf.d/code-server.conf" <<EOF
[program:code-server]
command=code-server --bind-addr 0.0.0.0:9889 --auth none
user=%(ENV_USER)s
autostart=true
autorestart=true
stopwaitsecs=30
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0
stderr_logfile=/dev/stderr
stderr_logfile_maxbytes=0
}
EOF

sudo supervisorctl reread && supervisorctl update

echo -e "\n===================Install code-server complete...\n================="

echo -e "\n===================Access: http://hostname:9889\n================="