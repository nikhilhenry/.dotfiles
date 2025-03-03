source /opt/ros/humble/setup.zsh
export FASTRTPS_DEFAULT_PROFILES_FILE=~/auv_ws/src/auv_ros2/super_client_configuration_file.xml
ros2 daemon stop
ros2 daemon start
