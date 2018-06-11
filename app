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
        docker run -it --rm docker-php-codesniffer phpcs -i
    ;;

    help)
        docker run -it --rm docker-php-codesniffer phpcs --help
        docker run -it --rm docker-php-codesniffer phpcbf --help
    ;;

    test)
        git clone https://github.com/symfony/asset.git test/symfony-asset > /dev/null 2>&1

        rm -rf test/symfony-asset-fixed
        cp -r test/symfony-asset test/symfony-asset-fixed

        ./app fix symfony-asset-fixed
        ./app report symfony-asset-fixed report-fixed
        ./app report symfony-asset report
    ;;

    report)
        rm -rf test/$3
        mkdir -p test/$3

        docker run --rm -w $(pwd) -v $(pwd):$(pwd) docker-php-codesniffer phpcs \
            --standard=$(pwd)/ruleset/custom.xml \
            --report-checkstyle=$(pwd)/test/$3/report-checkstyle.xml \
            --report-full=$(pwd)/test/$3/report-full.txt \
            --report-csv=$(pwd)/test/$3/report-csv.csv \
            --report-xml=$(pwd)/test/$3/report-xml.xml \
            --report-json=$(pwd)/test/$3/report-json.json \
            --report-junit=$(pwd)/test/$3/report-junit.xml \
            --report-emacs=$(pwd)/test/$3/report-emacs.txt \
            --report-source=$(pwd)/test/$3/report-source.txt \
            --report-summary=$(pwd)/test/$3/report-summary.txt \
            --report-diff=$(pwd)/test/$3/report-diff.txt \
            --report-svnblame=$(pwd)/test/$3/report-svnblame.txt \
            --report-gitblame=$(pwd)/test/$3/report-gitblame.txt \
            $(pwd)/test/$2/
    ;;

    fix)
        docker run --rm -w $(pwd) -v $(pwd):$(pwd) docker-php-codesniffer phpcbf \
            --standard=$(pwd)/ruleset/custom.xml \
            $(pwd)/test/$2/
    ;;

    *)
        echo " - create  create container"
        echo " - bash    bash into container"
        echo " - verify  verify container and versions"
        echo " - help    help container"
        echo " - test    run test codesniffer"
    ;;
esac