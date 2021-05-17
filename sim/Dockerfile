FROM ros:kinetic-ros-core

LABEL maintainer="Yosuke Matsusaka <yosuke.matsusaka@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y supervisor && \
    apt-get clean

ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
