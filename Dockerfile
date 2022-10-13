FROM ubuntu:latest
MAINTAINER GarretSidzaka <contact@2enp.com>

VOLUME ["/var/www"]

RUN export DEBIAN_FRONTEND=noninteractive && \   
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      ca-certificates \
      apt-transport-https \
      lsb-release \      
      apache2 \
      php7.4 \
      php7.4-mysql \
      php-common \
      php7.4-cli \
      php7.4-json \
      php7.4-common \
      php7.4-opcache \
      php7.4-xml \
      php7.4-xsl \
      php7.4-gd \
      php7.4-zip \
      php7.4-soap \
      php7.4-opcache \
      php7.4-sqlite3 \
      php7.4-pgsql \
      libapache2-mod-php7.4 \
      composer

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
