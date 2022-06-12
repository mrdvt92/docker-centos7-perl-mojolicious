FROM centos:7

ENV container docker

RUN echo "centos7-systemd: From: https://hub.docker.com/_/centos#Systemd+integration";\
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);\
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*;\
rm -f /lib/systemd/system/sockets.target.wants/*udev*;\
rm -f /lib/systemd/system/sockets.target.wants/*initctl*;\
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*

RUN yum -y install epel-release

RUN yum -y update

#Install Mojolicious dependancies from yum
RUN yum -y install perl-Mojolicious

RUN yum -y erase perl-Mojolicious

#Install Mojolicious dependancies
RUN yum -y install gcc /usr/bin/cpanm

#Install Mojolicious latest version from CPAN
RUN cpanm Mojolicious

#Install App
COPY my_app /my_app
COPY my_app.sh /my_app.sh

#From: https://hub.docker.com/_/centos but I do not know what this statement does
VOLUME [ "/sys/fs/cgroup" ]

#Expose web server on port 8080 - default port but can be configured in my_app/my_app.conf
EXPOSE 8080

#Command to start Systemd
ENTRYPOINT /my_app.sh
