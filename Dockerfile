#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM bradrydzewski/java:oraclejdk7

# Install Java
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common
ADD hosts /tmp/hosts
ENTRYPOINT umount /etc/hosts && cat /tmp/hosts >> /etc/hosts && bash
RUN sudo apt-get install -y git


# Define default command.
CMD ["java"]
