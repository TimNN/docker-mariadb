FROM sameersbn/ubuntu:14.04.20150613
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db \
 && add-apt-repository 'deb http://mirror.netcologne.de/mariadb/repo/10.0/ubuntu trusty main' \
 && apt-get update \
 && apt-get install -y mariadb-server \
 && rm -rf /var/lib/apt/lists/* # 20150613

# RUN apt-get update \
#  && apt-get install -y mysql-server \
#  && rm -rf /var/lib/mysql/mysql \
#  && rm -rf /var/lib/apt/lists/* # 20150613

ADD start /start
RUN chmod 755 /start

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/start"]
