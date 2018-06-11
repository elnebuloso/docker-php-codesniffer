FROM composer
MAINTAINER jeff.tunessen@gmail.com

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /srv

RUN composer global require squizlabs/php_codesniffer --no-suggest --no-ansi --no-interaction \
    && ln -s /srv/vendor/bin/phpcs /usr/local/bin/phpcs \
    && ln -s /srv/vendor/bin/phpcbf /usr/local/bin/phpcbf

#ENTRYPOINT ["pdepend"]
CMD ["-"]