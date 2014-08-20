#! /bin/bash
service collector start
/usr/bin/mongod --noprealloc --smallfiles >> /var/log/mongodb.log
