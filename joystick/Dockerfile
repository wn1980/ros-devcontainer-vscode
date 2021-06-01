FROM ros:kinetic-ros-core

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN  apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \ 
	ros-$ROS_DISTRO-joy \
	ros-$ROS_DISTRO-joystick-drivers \
	ros-$ROS_DISTRO-teleop-twist-joy \
	joystick

COPY ./start.launch /

RUN usermod -aG dialout root && \
	usermod -aG plugdev root && \
	usermod -aG input root

CMD ["roslaunch", "--wait", "start.launch"]