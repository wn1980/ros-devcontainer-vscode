FROM ubuntu:20.04

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    curl \
    ca-certificates \
    fluxbox \
    xfonts-base \
    xauth \
    x11-xkb-utils \
    xkb-data \
    dbus-x11 \
#    python \
#    python-numpy \
#    python3-pip \
    net-tools \
    novnc \
    supervisor \
    tigervnc-standalone-server \
    tigervnc-xorg-extension && \
#    pip3 install -U setuptools wheel && \
#    pip3 install -U websockify && \
#    apt-get remove -y python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV NO_VNC_HOME=/usr/share/novnc/ 

COPY ./app /app

COPY ./index.html $NO_VNC_HOME

VOLUME /tmp/.X11-unix

ENV DISPLAY ":1"

EXPOSE 6901

CMD ["supervisord", "-c", "/app/supervisord.conf"]