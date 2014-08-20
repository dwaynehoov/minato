# Sumo Logic docker
# VERSION               0.1

FROM      ubuntu:latest
MAINTAINER Dwayne Hoover <dwayne@sumologic.com>

ADD https://collectors.sumologic.com/rest/download/deb/64 /tmp/collector.deb
ADD sumo.conf /etc/sumo.conf
ADD sources.json /etc/sources.json

# install deb
RUN dpkg -i /tmp/collector.deb

# Cleanup
RUN rm -rf /tmp/*
