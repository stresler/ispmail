#!/bin/bash

# Generate the right config
confd -onetime -backend env

# Start Postfix
service postfix start
