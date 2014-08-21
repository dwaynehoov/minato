minato
======
minato is japanese for harbor

docker container and configuration files for Sumo Logic collector

the Dockerfile will build an image that installs and runs a Sumo Logic collector in a docker container.  For example purposes, it als installs and runs mongoDB.  This could be altered to suit your needs.

alternative options are to use the "docker logs" command with the follow option and have a collector on the host pick them up or pipe them to a hosted (URL) Sumo Logic collector.  there is a curl wrapper called "watch_docker.sh" in the utils directory to make this easier.

another alternative is to bind a volume from your containers to the host and aggregate the logs there.

future enhancements are:

create a sumo logic helper container with only the collector (true docker fashion, one purpose) - including logic/scripts to pull log data from neighboring containers
