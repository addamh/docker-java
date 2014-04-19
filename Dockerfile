#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM bradrydzewski/java:oraclejdk8

# Install Java
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common git

ADD hosts /tmp/hosts
RUN sudo perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib/x86_64-linux-gnu/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override

# Define default command.
CMD ["java"]
