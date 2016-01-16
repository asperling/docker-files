FROM composer/composer
MAINTAINER Achim Sperling <achim.sperling@gmail.com>

ENV BOOKDOWN_VERSION 0.5.0
ENV TEMPLATES_PATH /templates
ENV VENDOR_PATH /root/composer/vendor/

RUN composer global require bookdown/bookdown:${BOOKDOWN_VERSION}

COPY ./entrypoint.sh /entrypoint.sh

VOLUME ["/templates", "/app"]

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
