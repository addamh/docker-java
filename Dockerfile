# Pull base image.
FROM bradrydzewski/java:oraclejdk7

# Install Java
RUN sudo apt-get update
RUN sudo apt-get install -y maven

ADD hosts /tmp/hosts
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN rbenv install 2.0.0-p353
RUN sudo perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib/x86_64-linux-gnu/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override
