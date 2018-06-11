# docker-php-codesniffer

Dockerized Squizlabs PHP Codesniffer

## docker

See Supported Tags at https://hub.docker.com/r/elnebuloso/php-codesniffer/tags/

## run

```
docker run --rm -w $(pwd) -v $(pwd):$(pwd) elnebuloso/php-codesniffer phpcs --version
docker run --rm -w $(pwd) -v $(pwd):$(pwd) elnebuloso/php-codesniffer phpcs -i
```