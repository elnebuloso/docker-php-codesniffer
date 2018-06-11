#/bin/bash

case "$1" in
    create)
        docker build -t docker-php-codesniffer --rm --pull -f Dockerfile .
    ;;

    bash)
        docker run -it --rm docker-php-codesniffer bash
    ;;

    verify)
        docker run -it --rm docker-php-codesniffer phpcs --version
        docker run -it --rm docker-php-codesniffer phpcs --version
    ;;

    help)
        docker run -it --rm docker-php-codesniffer --help
    ;;

    test)
        rm -rf test/report
        mkdir -p test/report
        git clone https://github.com/symfony/asset.git test/symfony-asset > /dev/null 2>&1

        docker run --rm -w $(pwd) -v $(pwd):$(pwd) docker-php-codesniffer \
            --jdepend-chart=$(pwd)/test/report/chart.svg \
            --overview-pyramid=$(pwd)/test/report/pyramid.svg \
            --dependency-xml=$(pwd)/test/report/dependency.xml \
            --summary-xml=$(pwd)/test/report/summary.xml \
            $(pwd)/test/symfony-asset/
    ;;

    *)
        echo " - create  create container"
        echo " - verify  verify container"
        echo " - help    help container"
        echo " - test    collect metrics from test"
    ;;
esac