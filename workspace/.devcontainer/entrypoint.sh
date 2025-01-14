#!/bin/bash -e

USER_ID=$(id -u)
GROUP_ID=$(id -g)

sudo usermod -u $USER_ID -o -m -d /home/developer developer > /dev/null 2>&1
sudo groupmod -g $GROUP_ID developer > /dev/null 2>&1
sudo chown -R developer:developer /workspace

ln -sfn /home/developer/.vscode /workspace/.vscode

rm -f /workspace/compile_flags.txt || true
sed -e 's@\$ROS_DISTRO@'"$ROS_DISTRO"'@' /home/developer/compile_flags.txt > /workspace/compile_flags.txt

ln -sfn /workspace /home/developer/workspace

source /opt/ros/$ROS_DISTRO/setup.bash

mkdir -p /workspace/catkin_ws/src && cd /workspace/catkin_ws/ && catkin_make || true

source /home/developer/workspace/catkin_ws/devel/setup.bash

echo "export ROS_MASTER_URI=${ROS_MASTER_URI}" >> ~/.bashrc
echo "export DISPLAY=${DISPLAY}" >> ~/.bashrc

cd /home/developer

exec $@
