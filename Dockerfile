FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

#update sources
copy assets/aliyun_ubuntu_14.04.list /etc/apt/sources.list
RUN apt-get update

RUN \
    apt-get install -y python-software-properties && \
    apt-get install -y software-properties-common

#Fix: debconf: unable to initialize frontend: Dialog
#RUN apt-get install dialog
#RUN dpkg-reconfigure debconf -f noninteractive -p high

#FIX: gpg: requesting key EEA14886 from hkp server keyserver.ubuntu.com
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

RUN add-apt-repository ppa:webupd8team/java 
RUN apt-get update

#debconf: (TERM is not set, so the dialog frontend is not usable.) fixby: DEBIAN_FRONTEND=nointeractive
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -qy oracle-java8-installer

RUN echo /usr/lib/jvm/java-8-oracle >> /etc/environment

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.6

WORKDIR /opt/

ADD http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz ./
RUN \
    tar -zxvf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    mv apache-tomcat-$TOMCAT_VERSION tomcat-$TOMCAT_VERSION && \
    rm apache-tomcat-$TOMCAT_VERSION.tar.gz

COPY ./assets/run.sh /run.sh
#RUN chmod u+x /run.sh

EXPOSE 8080 8443

WORKDIR /
ENTRYPOINT ["./run.sh"]
