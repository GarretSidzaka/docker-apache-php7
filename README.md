docker-apache-php7
===================================

A Docker image based on Ubuntu, serving PHP 7.4 running as Apache Module. Useful for Web developers in need for a fixed PHP version. In addition, the `error_reporting` setting in php.ini is configurable per container via environment variable.

Tags
-----

* latest: Ubuntu (LTS), Apache , PHP 7.4 with support for setting `error_reporting`

Usage
------

```
$ docker run -d -P garretsidzaka/docker-apache-php7
```

With all the options:

```bash
$ docker run -d -p 8080:80 \
    -v /home/user/webroot:/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' \
    garretsidzaka/docker-apache-php7
```

* `-v [local path]:/var/www` maps the container's webroot to a local path
* `-p [local port]:80` maps a local port to the container's HTTP port 80
* `-e PHP_ERROR_REPORTING=[php error_reporting settings]` sets the value of `error_reporting` in the php.ini files.

### Access apache logs

Apache is configured to log both access and error log to STDOUT. So you can simply use `docker logs` to get the log output:

`docker logs -f container-id`


Installed packages
-------------------
* Ubuntu Server LTS based on ubuntu docker image
      apache2 
      php7.4 
      php7.4-mysql 
      php-common 
      php7.4-cli 
      php7.4-json 
      php7.4-common 
      php7.4-opcache 
      php7.4-xml 
      php7.4-xsl 
      php7.4-zip 
      php7.4-soap 
      php7.4-opcache 
      php7.4-sqlite3 
      php7.4-pgsql 
      libapache2-mod-php7.4 
      composer

Default Configurations
----------------------

* Apache: .htaccess-Enabled in webroot (mod_rewrite with AllowOverride all)
* php.ini:
  * display_errors = On
  * error_reporting = E_ALL (default, overridable per env variable)

