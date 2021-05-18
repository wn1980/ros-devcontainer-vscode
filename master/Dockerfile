FROM ros:kinetic-ros-core

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \ 
	ros-$ROS_DISTRO-rosbridge-server \
	ros-$ROS_DISTRO-tf2-web-republisher \
	build-essential

COPY ./root/ /root/

RUN source /opt/ros/$ROS_DISTRO/setup.bash && \
	cd ~/catkin_ws && \
	catkin_make install -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/ros/$ROS_DISTRO -DCATKIN_ENABLE_TESTING=0 && \
	cd /root && rm -rf catkin_ws

COPY ./start.launch /

EXPOSE 9090 11311

CMD ["roslaunch", "start.launch"]