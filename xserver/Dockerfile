#FROM node:12 AS novnc

# noVNC with chrome77 workaround patch
#RUN git clone https://github.com/novnc/noVNC.git /novnc

#RUN cd /novnc && \
#    npm install && \
#    ./utils/use_require.js --as commonjs --with-app --clean

FROM ubuntu:18.04

MAINTAINER Yosuke Matsusaka <yosuke.matsusaka@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#install noVNC
COPY ./*.tar.gz /

ENV NO_VNC_HOME=/novnc

RUN mkdir -p $NO_VNC_HOME/utils/websockify && \
	tar xzfv noVNC-1.2.0.tar.gz --strip 1 -C $NO_VNC_HOME && \
	tar xzfv websockify-0.9.0.tar.gz --strip 1 -C $NO_VNC_HOME/utils/websockify && \
	chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	rm -f noVNC-1.2.0.tar.gz websockify-0.9.0.tar.gz

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
 #   python3 \
 #   python3-pip \
    supervisor \
    tigervnc-standalone-server && \
#    pip3 install -U setuptools wheel && \
#    pip3 install -U websockify && \
#    apt-get remove -y python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#COPY --from=novnc /novnc/build /novnc

COPY . /app

#RUN cp /app/index.html /app/vnc_min.html /novnc/
RUN cp /app/index.html /app/vnc_min.html $NO_VNC_HOME

VOLUME /tmp/.X11-unix

VOLUME /tmp/supervisord.pid

ENV DISPLAY ":1"

EXPOSE 6901

CMD ["supervisord", "-c", "/app/supervisord.conf"]
