FROM ubuntu:16.04

EXPOSE 5000 35357
ENV KEYSTONE_ADMIN_PASSWORD passw0rd
ENV CONTROLLER localhost

RUN apt-get -y update && apt-get install -y keystone apache2 libapache2-mod-wsgi openstack

ADD bootstrap.sh /bootstrap.sh

CMD sh -x /bootstrap.sh
