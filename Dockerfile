FROM ubuntu-sshd

RUN groupadd -g 66 -r mysql
RUN useradd -u 66 -r -g mysql mysql

RUN apt-get update
RUN echo 'mysql-server-5.1 mysql-server/root_password password root123' |  debconf-set-selections
RUN echo 'mysql-server-5.1 mysql-server/root_password_again password root123'| debconf-set-selections
RUN apt-get install -y mysql-server

VOLUME ["/var/lib/mysql"]
EXPOSE 3306

ADD mysql.supervisor.conf /etc/supervisor/conf.d/
