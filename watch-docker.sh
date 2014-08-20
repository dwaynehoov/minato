#! /bin/bash
URL="https://collectors.sumologic.com/receiver/v1/http/<unique URL string>"
while read data;
do
        curl --data "$data" $URL
done
