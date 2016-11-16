FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

COPY ./assets/aliyun_ubuntu_14.04.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install wget

RUN wget http://nginx.org/keys/nginx_signing.key && \ 
    apt-key add nginx_signing.key

RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx " >> /etc/apt/sources.list && \
    echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx " >> /etc/apt/sources.list

RUN apt-get update 

RUN apt-get install nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
