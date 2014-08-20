# Sumo Logic docker
# VERSION               0.1

FROM      ubuntu:latest
MAINTAINER Dwayne Hoover <dwayne@sumologic.com>

ADD https://collectors.sumologic.com/rest/download/deb/64 /tmp/collector.deb
ADD sumo.conf /etc/sumo.conf
# ADD sources.json /etc/sources.json

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

# CMD service collector start
# CMD /usr/bin/mongod --fork --logpath /var/log/mongodb.log --noprealloc --smallfiles
ADD go.sh /usr/local/bin/go.sh
RUN chmod 755 /usr/local/bin/go.sh
CMD /usr/local/bin/go.sh
