FROM centos:centos7
MAINTAINER Quang LAM quangylam@gmail.com

RUN yum -y install epel-release && \
	yum -y update && \
	yum -y install nginx && \
	yum clean all && \
	mkdir -p /usr/share/nginx/html && \
	echo "nginx on CentOS7" > /usr/share/nginx/html/index.html

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
COPY Dockerfile /
