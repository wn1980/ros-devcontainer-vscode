#FROM node:12 AS novnc

# noVNC with chrome77 workaround patch
#RUN git clone https://github.com/phcapde/noVNC.git /novnc

#RUN cd /novnc && \
#    npm install && npm audit fix && \
#    ./utils/use_require.js --as commonjs --with-app --clean

FROM ubuntu:20.04

LABEL maintainer="Yosuke Matsusaka <yosuke.matsusaka@gmail.com>"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

#ENV NO_VNC_HOME=/novnc
ENV NO_VNC_HOME=/usr/share/novnc/ 

#COPY --from=novnc /novnc/build /novnc

COPY . /app

#install noVNC

#WORKDIR /app

#RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
#	tar xzfv noVNC-1.2.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
#	tar xzfv websockify-0.9.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
#	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
#	rm -f noVNC-1.2.0.tar.gz websockify-0.9.0.tar.gz
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    curl \
    ca-certificates \
    fluxbox \
    xfonts-base \
    xauth \
    x11-xkb-utils \
    xkb-data \
    dbus-x11 \
    python \
    python-numpy \
#   python3-pip \
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



#RUN cp /app/index.html /app/vnc_min.html /novnc/
RUN mv /app/index.html /app/vnc_min.html $NO_VNC_HOME

VOLUME /tmp/.X11-unix

VOLUME /tmp/supervisord.pid

ENV DISPLAY ":1"

EXPOSE 6901

CMD ["supervisord", "-c", "/app/supervisord.conf"]
