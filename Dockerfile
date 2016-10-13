FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

ENV NVM_DIR /usr/local/.nvm
ENV NODE_VERSION stable
RUN ln -s -f /bin/bash /bin/sh

#add aliyun sources
COPY ./assets/aliyun_ubuntu_14.04.list /etc/apt/sources.list
RUN apt-get update

#install git
RUN apt-get -y install git curl

#install nvm
RUN git clone https://github.com/creationix/nvm.git $NVM_DIR && \
    cd $NVM_DIR && \
    git checkout `git describe --abbrev=0 --tags`

RUN source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

RUN echo "source ${NVM_DIR}/nvm.sh" >> $HOME/.bashrc && \
    source $HOME/.bashrc

