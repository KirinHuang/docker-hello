FROM ubuntu:trusty
MAINTAINER kirnhuang@126.com

ADD ./assets/run.sh /

CMD ["/bin/echo", "hello, docker!"]

