FROM almalinux:9

RUN yum -y install epel-release
RUN yum -y update

#Install Mojolicious dependancies from yum
RUN yum -y install perl-Mojolicious

#Install Mojolicious latest version from CPAN
#RUN cpanm Mojolicious

#Install App
COPY my_app /my_app

#Expose web server on port 8080 - default port but can be configured in my_app/my_app.conf
EXPOSE 8080

CMD ["hypnotoad", "-f", "/my_app/script/my_app"]
