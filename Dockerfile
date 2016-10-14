FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

COPY ./assets/aliyun_ubuntu_14.04.list /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y curl
#Install source
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs

#Build source
RUN apt-get install -y build-essential

#Install yarn
RUN apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
