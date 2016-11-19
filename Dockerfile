FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

COPY ./assets/aliyun_ubuntu_14.04.list /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y python-pip
RUN apt-get install -y python-setuptools m2crypto

# INSTALL SS
RUN pip install shadowsocks


