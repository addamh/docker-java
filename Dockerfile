#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM bradrydzewski/java:oraclejdk7

# Install Java
RUN apt-get install -y software-properties-common
RUN apt-get update
ADD hosts /tmp/hosts
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override
RUN apt-get install -y git


# Define default command.
CMD ["java"]
