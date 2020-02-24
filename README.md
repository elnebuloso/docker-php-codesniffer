<img src="https://raw.githubusercontent.com/elnebuloso/docker-php-codesniffer/master/logo.png" width="100%"/>

# docker-php-codesniffer

![Release](https://github.com/elnebuloso/docker-php-codesniffer/workflows/Release/badge.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/elnebuloso/php-codesniffer.svg)](https://hub.docker.com/r/elnebuloso/php-codesniffer)
[![GitHub](https://img.shields.io/github/license/elnebuloso/docker-php-codesniffer.svg)](https://github.com/elnebuloso/docker-php-codesniffer)

Dockerized Squizlabs PHP Codesniffer

## github

- https://github.com/elnebuloso/docker-php-codesniffer

## docker

- https://hub.docker.com/r/elnebuloso/php-codesniffer
- https://hub.docker.com/r/elnebuloso/php-codesniffer/tags
- weekly builds, 0 0 * * 0

## run

```
docker run --rm -w $(pwd) -v $(pwd):$(pwd) elnebuloso/php-codesniffer phpcs --version
docker run --rm -w $(pwd) -v $(pwd):$(pwd) elnebuloso/php-codesniffer phpcs -i
```