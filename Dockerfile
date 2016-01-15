#
# build docker image to run the transmission
#

FROM centos:latest
MAINTAINER XiangJL xjl-tommy@qq.com

# add repos
# RUN curl http://mirrors.aliyun.com/repo/Centos-7.repo > /etc/yum.repos.d/CentOS-Base.repo && \
#     curl http://mirrors.aliyun.com/repo/epel-7.repo > /etc/yum.repos.d/epel.repo

# install software
RUN yum makecache && \
    yum install -y epel-release && \
    yum makecache && \
    yum install -y transmission-daemon && \
    yum clean all && \
    mkdir -p /docker/ && \
    mkdir -p /downloads/

COPY ./config.tar.gz /docker/
COPY ./startup.sh /docker/

VOLUME ["/var/lib/transmission/","/downloads/"]
EXPOSE 9091/tcp 51413/tcp 51413/udp
WORKDIR /var/lib/transmission/
ENTRYPOINT ["/docker/startup.sh"]
