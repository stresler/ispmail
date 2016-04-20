FROM debian:jessie
MAINTAINER Sam Tresler "sam@treslervania.com"

ENV CONFD_VERSION "0.11.0"

COPY conf.d/* /etc/confd/conf.d/
COPY templates/* /etc/confd/templates/
COPY entrypoint.sh /entrypoint.sh
COPY supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN \
  apt-get update -q && \
  apt-get install -qy \
    postfix \
    postfix-mysql \
    supervisor \
    wget && \
  wget https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
  mv confd-${CONFD_VERSION}-linux-amd64 /usr/bin/confd && \
  chmod +x  /usr/bin/confd && \
  chmod +x /entrypoint.sh && \
  echo "virtual_alias_maps = mysql:/etc/postfix/mysql-virtual-alias-maps.cf" >> /etc/postfix/main.cf && \
  echo "virtual_mailbox_domains = mysql:/etc/postfix/mysql-virtual-mailbox-domains.cf" >> /etc/postfix/main.cf && \
  echo "virtual_mailbox_maps = mysql:/etc/postfix/mysql-virtual-mailbox-maps.cf" >> /etc/postfix/main.cf 

VOLUME /var/log/postfix
VOLUME /var/spool/postfix

EXPOSE 465/tcp 587/tcp

ENTRYPOINT [ "/entrypoint.sh" ]
