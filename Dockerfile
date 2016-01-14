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
    yum clean all

VOLUME /var/lib/transmission/
EXPOSE 9091/tcp 51413/tcp 51413/udp
WORKDIR /var/lib/transmission/
ENTRYPOINT ["transmission-daemon", "--foreground", "--config-dir", "/var/lib/transmission-daemon/", "--log-error"]
