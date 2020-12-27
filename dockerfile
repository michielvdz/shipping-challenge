FROM ubuntu:latest
 
RUN apt-get update  -y

RUN apt-get install nginx -y
RUN apt-get install spawn-fcgi -y
RUN apt-get install fcgiwrap -y
RUN apt-get install perl -y
RUN apt-get install libdbi-perl -y
RUN apt-get install libdbd-mariadb-perl -y

COPY ./index /var/www/shipping
RUN chmod 777 /var/www/shipping

COPY ./start.sh /
RUN chmod 777 /start.sh

CMD ["/start.sh"]

