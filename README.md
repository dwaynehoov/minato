minato
======
minato is japanese for harbor

docker container and configuration files for Sumo Logic collector

the Dockerfile will build an image that installs and runs a Sumo Logic collector in a docker container

alternative options are to use the "docker logs" command with the follow option and have a collector on the host pick them up
another alternative is to bind a volume from your containers to the host and aggregate the logs there
