FROM php:7.1.9-apache

# Default New Relic key used here is randomly generated. Not a real key.
ARG NEWRELIC_KEY=zvc8scigyaegg8qt2uwjk6u3z9frbdoe2jr2sw7i

ENV DEBIAN_FRONTEND   noninteractive
ENV TERM              xterm
ENV NR_INSTALL_SILENT 1
ENV NR_INSTALL_KEY    $NEWRELIC_KEY

RUN \
    echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list && \
    apt-key adv --fetch-keys http://download.newrelic.com/548C16BF.gpg                                   && \
    apt-get update                                                                                       && \
    apt-get install -y newrelic-php5                                                                     && \
    newrelic-install install

COPY html/*.* /var/www/html/
