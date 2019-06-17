#!/bin/bash

openssl genrsa -out task.key 2048
openssl req -new -key task.key -out task.csr
# CRT
openssl x509 -req -days 365 -in task.csr -signkey task.key -out task.crt
mkdir -p /etc/ssl/private
bash -c 'cat task.key task.crt >> /etc/ssl/private/task.pem'