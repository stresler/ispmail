FROM debian:jessie
MAINTAINER Sam Tresler "sam@treslervania.com"

ENV CONFD_VERSION "0.11.0"

COPY conf.d/* /etc/confd/conf.d/
COPY templates/* /etc/confd/templates/
COPY entrypoint.sh /entrypoint.sh

RUN \
  apt-get update -q && \
  apt-get install -qy \
    dovecot-mysql \
    dovecot-imapd \
    dovecot-managesieved \
    dovecot-lmtpd && \
