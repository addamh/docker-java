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

RUN sudo touch etc/dnsmasq.d/0hosts

# /etc/hosts values
RUN sudo echo 'address="/ci.ttagg.com/192.168.3.32"' >> /etc/dnsmasq.d/0hosts

RUN sudo touch /etc/dnsmasq.conf

# dnsmasq configuration
RUN sudo echo 'listen-address=127.0.0.1' >> /etc/dnsmasq.conf
RUN sudo echo 'resolv-file=/etc/resolv.dnsmasq.conf' >> /etc/dnsmasq.conf
RUN sudo echo 'conf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf

# google dns
RUN sudo echo 'nameserver 8.8.8.8' >> /etc/resolv.dnsmasq.conf
RUN sudo echo 'nameserver 8.8.4.4' >> /etc/resolv.dnsmasq.conf

RUN sudo apt-get install -y git


# Define default command.
CMD ["java"]
