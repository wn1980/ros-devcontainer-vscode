FROM ros:kinetic-ros-core

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    ros-$ROS_DISTRO-turtlebot-gazebo \
    python-pip && \
    pip install -U --no-cache-dir supervisor supervisor_twiddler && \
    apt-get clean

# OSRF distribution is better for gazebo
#RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' && \
#    curl -L http://packages.osrfoundation.org/gazebo.key | apt-key add -

ADD ros_entrypoint.sh /

ADD supervisord.conf /etc/supervisor/supervisord.conf

#VOLUME /opt/ros/melodic/share/turtlebot3_description

CMD ["/usr/local/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
