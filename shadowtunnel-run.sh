#!/usr/bin/env bash
proxy http -p 127.0.0.1:38080 &
shadowtunnel -e -m aes-256-cfb -p ${SHADOWPASS} -f 127.0.0.1:38080 -l :44444

