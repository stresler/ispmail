#!/bin/bash

# Generate the right config from environment variables.
confd -onetime -backend env

chown root:root /etc/dovecot/dovecot-sql.conf.ext
chmod go= /etc/dovecot/dovecot-sql.conf.ext

# Start Dovecot 
exec /bin/true

