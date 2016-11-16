FROM centos
MAINTAINER Quang LAM quangylam@gmail.com

ARG env
ARG secure_pass
ARG dnsmasq_ver


RUN yum -y install bash network-tools dnsmasq

VOLUME /etc/dnsmasq.d

EXPOSE 5353

ENTRYPOINT ["/usr/sbin/dnsmasq", "-d", "-p", "5353"]

COPY Dockerfile /
