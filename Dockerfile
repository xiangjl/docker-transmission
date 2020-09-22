#
# build docker image to run the transmission
#

FROM centos:7
MAINTAINER XiangJL xjl-tommy@qq.com

ENV VERSION=v1.6.1-update1

# install software
RUN yum makecache && \
    yum install -y epel-release && \
    yum makecache && \
    yum install -y transmission-daemon wget && \
    yum clean all && \
    mkdir -p /transmission /docker /downloads

COPY ./settings.json /docker/
COPY ./startup.sh /docker/

RUN cd /docker && \
    wget https://github.com/ronggang/transmission-web-control/archive/v$VERSION.tar.gz -O transmission-control-full.tar.gz && \
    mv /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    tar zxvf /docker/transmission-control-full.tar.gz && \
    cp -r /docker/transmission-web-control-$VERSION/src/. /usr/share/transmission/web/

VOLUME ["/transmission/","/downloads/"]
EXPOSE 9091/tcp 51413/tcp 51413/udp

ENTRYPOINT ["/docker/startup.sh"]
