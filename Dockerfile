#
# build docker image to run the transmission
#

FROM centos:latest
MAINTAINER XiangJL xjl-tommy@qq.com

# install software
RUN yum makecache && \
    yum install -y epel-release && \
    yum makecache && \
    yum install -y transmission-daemon && \
    yum clean all && \
    mkdir -p /transmission /docker /downloads

COPY ./transmission-control-full.tar.gz /docker

RUN mv /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    tar zxvf /docker/transmission-control-full.tar.gz -C /usr/share/transmission/

VOLUME ["/transmission","/downloads"]
EXPOSE 9091/tcp 51413/tcp 51413/udp

ENTRYPOINT ["/usr/bin/transmission-daemon","--foreground","--log-error","--config-dir","/transmission","--download-dir","/downloads"]
