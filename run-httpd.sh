#!/bin/bash

haproxy -f /etc/haproxy/haproxy.cfg && /usr/sbin/apachectl -D FOREGROUND