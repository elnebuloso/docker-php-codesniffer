FROM composer
MAINTAINER jeff.tunessen@gmail.com

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /srv

RUN echo "install packages" \
    && composer global require squizlabs/php_codesniffer:^3.3 --no-suggest --no-ansi --no-interaction \
    && composer global require elnebuloso/codesniffer-flex1-coding-standard:^1.0 --no-suggest --no-ansi --no-interaction \
    && composer global require escapestudios/symfony2-coding-standard:^3.4 --no-suggest --no-ansi --no-interaction \
    && composer global require cakephp/cakephp-codesniffer:^3.0 --no-suggest --no-ansi --no-interaction \
    && ln -s /srv/vendor/bin/phpcs /usr/local/bin/phpcs \
    && ln -s /srv/vendor/bin/phpcbf /usr/local/bin/phpcbf \
    && phpcs --config-set installed_paths /srv/vendor/elnebuloso/codesniffer-flex1-coding-standard/src,/srv/vendor/escapestudios/symfony2-coding-standard,/srv/vendor/cakephp/cakephp-codesniffer

CMD ["-"]