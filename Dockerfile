From centos:centos6
MAINTAINER yexing@edanzgroup.com

#Base:
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD docker-scripts/CentOS-Base.repo  /etc/yum.repos.d/
RUN yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y update 
RUN yum -y install monit

#APP package dependence:
RUN yum -y install httpd php php-mysql php-gd php-mbstring php-cli perl
RUN yum clean all 

#APP software:
ADD index.html /var/www/html/
ADD upload.php /var/www/html/
RUN mkdir -p /var/www/html/uploads && chown apache.apache /var/www/html/uploads
ADD texcount /opt/texcount/

#APP daemon start config:
ADD docker-scripts/monitrc  /etc/monitrc
ADD docker-scripts/start.sh /
RUN chmod 600 /etc/monitrc && chmod +x /start.sh

#APP start:
EXPOSE 80 2812
CMD ["bash","/start.sh"]

