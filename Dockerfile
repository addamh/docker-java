#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM bradrydzewski/java:oraclejdk7

# Install Java
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common dnsmasq

# /etc/hosts values
RUN echo 'address="/ci.ttagg.com/192.168.3.32"' >> /etc/dnsmasq.d/0hosts

# dnsmasq configuration
RUN echo 'listen-address=127.0.0.1' >> /etc/dnsmasq.conf
RUN echo 'resolv-file=/etc/resolv.dnsmasq.conf' >> /etc/dnsmasq.conf
RUN echo 'conf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf

# google dns
RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.dnsmasq.conf
RUN echo 'nameserver 8.8.4.4' >> /etc/resolv.dnsmasq.conf

RUN sudo apt-get install -y git


# Define default command.
CMD ["java"]
