#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM bradrydzewski/java:oraclejdk8

# Install Java
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common

ADD hosts /tmp/hosts
RUN sudo umount /etc/hosts && cat /tmp/hosts >> /etc/hosts
RUN sudo apt-get install -y git

# Define default command.
CMD ["java"]
