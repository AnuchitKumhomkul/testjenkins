#Download base image ubuntu 16.04
FROM ubuntu:16.04

USER root

#Update software repository
RUN apt-get update -y

RUN usermod -a -G docker jenkins

USER jenkins