FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && apt-get install -y apache2 && apt-get install lynx
COPY mi_aplicacion/index.html /var/www/html/
EXPOSE 80
VOLUME /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]
