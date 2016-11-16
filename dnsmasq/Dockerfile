FROM centos
MAINTAINER Quang LAM quangylam@gmail.com

RUN yum -y install dnsmasq

VOLUME /etc/dnsmasq.d

EXPOSE 5353

ENTRYPOINT ["/usr/sbin/dnsmasq", "-d", "-p", "5353"]

COPY Dockerfile /
