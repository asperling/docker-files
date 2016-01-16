FROM composer/composer
MAINTAINER Achim Sperling <achim.sperling@gmail.com>

ENV BOOKDOWN_VERSION 0.5.0
ENV TEMPLATES_PATH /usr/local/bookdown/vendor/tobiju/bookdown-bootswatch-templates/templates
ENV VENDOR_PATH /usr/local/bookdown/vendor/

RUN mkdir -p /usr/local/bookdown \
    && mkdir -p "${HOME}/.ssh" \
    && echo "Host github.com" > "${HOME}/.ssh/config" \
    && echo "    StrictHostKeyChecking no" > "${HOME}/.ssh/config"

COPY composer.json /usr/local/bookdown/
RUN cd /usr/local/bookdown \
    && composer install

VOLUME ["/app"]

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
