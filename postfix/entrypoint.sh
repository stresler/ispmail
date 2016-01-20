#!/bin/bash

# Generate the right config
confd -onetime -backend env

# Start Postfix
exec /usr/lib/postfix/master -c /etc/postfix -d 2>&1
