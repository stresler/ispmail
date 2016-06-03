FROM debian:jessie
MAINTAINER Sam Tresler "sam@treslervania.com"

ENV CONFD_VERSION "0.11.0"

COPY conf.d/* /etc/confd/conf.d/
COPY templates/* /etc/confd/templates/
COPY entrypoint.sh /entrypoint.sh

RUN \
  chmod +x /entrypoint.sh && \
  apt-get update -q && \
  apt-get install -qy \
    dovecot-mysql \
    dovecot-imapd \
    dovecot-managesieved \
    dovecot-lmtpd  \
    wget && \
  wget https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
  mv confd-${CONFD_VERSION}-linux-amd64 /usr/bin/confd && \
  chmod +x  /usr/bin/confd && \
  groupadd -g 5000 vmail && \
  useradd -g vmail -u 5000 vmail -d /var/vmail -m && \
  sed -i "s/\!include auth-system.conf.ext/#\!include auth-system.conf.ext/" /etc/dovecot/conf.d/10-auth.conf && \
  sed -i "s/#\!include auth-sql.conf.ext/\!include auth-sql.conf.ext/" /etc/dovecot/conf.d/10-auth.conf && \
  sed -i "s/mail_location = mbox:~\/mail:INBOX=\/var\/mail\/%u/mail_location = maildir:\/var\/vmail\/%d\/%n\/Maildir/" /etc/dovecot/conf.d/10-mail.conf   
RUN \
  sed -i "s/ssl = no/ssl = yes/" /etc/dovecot/conf.d/10-ssl.conf && \
  sed -i "s/#ssl_cert = <\/etc\/dovecot\/dovecot.pem/ssl_cert = <\/etc\/dovecot\/ssl\/dovecot.pem/" /etc/dovecot/conf.d/10-ssl.conf && \
  sed -i "s/#ssl_key = <\/etc\/dovecot\/private\/dovecot.pem/ssl_key = <\/etc\/dovecot\/ssl\/dovecot.key/" /etc/dovecot/conf.d/10-ssl.conf && \
  chown root:root /etc/dovecot/dovecot-sql.conf.ext && \
  chmod go= /etc/dovecot/dovecot-sql.conf.ext 

# Overwrite config files we need to change non-dynamically.
COPY conf/auth-sql.conf.ext /etc/dovecot/conf.d/auth-sql.conf.ext
COPY conf/10-master.conf /etc/dovecot/conf.d/10-master.conf
COPY conf/15-mailboxes.conf /etc/dovecot/conf.d/15-mailboxes.conf
 
#ENTRYPOINT [ "/entrypoint.sh" ]  
