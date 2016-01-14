FROM debian:jessie
MAINTAINER Sam Tresler "sam@treslervania.com"

ENV CONFD_VERSION "0.11.0"

RUN \
  apt-get update -q && \
  apt-get install -qy \
  postfix \
  postfix-mysql && \
  apt-get --purge remove 'exim4*' && \
  curl -o /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
  chmod +x  /usr/bin/confd && \
  mkdir -p /etc/confd/{conf.d,templates}

COPY postfix/conf.d/* /etc/confd/conf.d
COPY postfix/templates/* /etc/confd/templates
COPY postfix/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
