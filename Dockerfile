#
# build docker image to run the transmission
#

FROM centos:latest
MAINTAINER XiangJL xjl-tommy@qq.com

# add repos
RUN curl http://mirrors.aliyun.com/repo/Centos-7.repo > /etc/yum.repos.d/CentOS-Base.repo && \
    curl http://mirrors.aliyun.com/repo/epel-7.repo > /etc/yum.repos.d/epel.repo

# install software
RUN yum makecache && \
    yum install -y epel-release && \
    yum makecache && \
    yum install -y transmission-daemon && \
    yum clean all && \
    mkdir -p /docker/ /downloads/ /storage/ && \
    chown transmission:transmission /downloads/ /storage/

COPY ./config.tar.gz /docker/
COPY ./startup.sh /docker/
COPY ./transmission-control-full.tar.gz /docker/

RUN mv /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    tar zxvf /docker/transmission-control-full.tar.gz -C /usr/share/transmission/

USER transmission

VOLUME ["/var/lib/transmission/","/downloads/"]
EXPOSE 9091/tcp 51413/tcp 51413/udp

ENTRYPOINT ["/docker/startup.sh"]
