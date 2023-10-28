FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && apt-get install -y apache2
VOLUME /var/www/html
COPY mi_aplicacion/index.html /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
