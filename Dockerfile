# Base images 基础镜像
FROM centos

#MAINTAINER 维护者信息
MAINTAINER nbboy

ADD beanstalkdv1.11.tar.gz /usr/local/
ADD epel-release-latest-7.noarch.rpm /usr/local/
RUN rpm -ivh /usr/local/epel-release-latest-7.noarch.rpm
RUN yum install -y wget lftp gcc gcc-c++ make openssl-devel pcre-devel pcre && yum clean all
WORKDIR /usr/local/beanstalkd-1.11
RUN make && make install
RUN ln -s /usr/local/bin/beanstalkd /usr/bin/beanstalkd
RUN mkdir -p /opt/data

EXPOSE 11300

CMD ["/usr/bin/beanstalkd"]

