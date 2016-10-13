FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

COPY ./assets/aliyun_ubuntu_14.04.list /etc/apt/sources.list

RUN apt-get update

#install git
RUN apt-get -y install git
