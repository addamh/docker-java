#
# Java Dockerfile
#
# https://github.com/dockerfile/java
#

# Pull base image.
FROM bradrydzewski/java:oraclejdk8

# Install Java
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common dnsmasq

  RUN sudo chmod 777 /etc/dnsmasq.conf 
  RUN sudo chmod 777 /etc/init.d/dnsmasq
  RUN sudo touch /etc/resolv.dnsmasq.conf
  RUN sudo echo 'address="/ci.ttagg.com/192.168.3.32"' >> /etc/dnsmasq.conf
  RUN sudo echo 'nameserver 192.168.0.1' >> /resolv.dnsmasq.conf
  RUN sudo echo 'resolv-file=/etc/resolv.dnsmasq.conf' >> /etc/dnsmasq.conf
  RUN sudo echo 'listen-address=127.0.0.1' >> /etc/dnsmasq.conf
  RUN sudo sed -i 's/need localmount net$/use localmount net/' /etc/init.d/dnsmasq
  
RUN sudo apt-get install -y git


# Define default command.
CMD ["java"]
