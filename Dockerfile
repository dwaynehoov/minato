# Sumo Logic docker
# VERSION               0.2
# Adjusted to follow approach outlined here: http://paislee.io/how-to-add-sumologic-to-a-dockerized-app/

FROM      ubuntu:latest
MAINTAINER Dwayne Hoover <dwayne@sumologic.com>

ADD https://collectors.sumologic.com/rest/download/deb/64 /tmp/collector.deb
ADD sumo.conf /etc/sumo.conf
# ADD sources.json /etc/sources.json

# ensure that the collector gets started when you launch
ADD start_sumo /etc/my_init.d/start_sumo
RUN chmod 755 /etc/my_init.d/start_sumo

# install deb
RUN dpkg -i /tmp/collector.deb

# let's install something
# put your own application here
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y -q mongodb-org
# Create the MongoDB data directory
RUN mkdir -p /data/db
EXPOSE 27017

# Cleanup
RUN rm -rf /tmp/*

# Deprecated - can wrap multiple apps/service in one shell script if needed
# ADD go.sh /usr/local/bin/go.sh
# RUN chmod 755 /usr/local/bin/go.sh
# CMD /usr/local/bin/go.sh

ENTRYPOINT usr/bin/mongod
