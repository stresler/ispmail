#!/bin/bash

# Generate the right config from environment variables.
confd -onetime -backend env

chown root:root /etc/dovecot/dovecot-sql.conf.ext
chmod go= /etc/dovecot/dovecot-sql.conf.ext

echo ${ISPMAIL_SSL_CERT} > /etc/dovecot/ssl/dovecot.pem
echo ${ISPMAIL_SSL_KEY} > /etc/dovecot/ssl/dovecot.key


# Start Dovecot 
exec /bin/true

