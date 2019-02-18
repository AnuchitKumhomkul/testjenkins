#Download base image ubuntu 16.04
FROM ubuntu:16.04

USER root

#Update software repository
RUN echo "hello world"

RUN usermod -a -G docker jenkins

USER jenkins
