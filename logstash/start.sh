#!/bin/bash

find /opt/logstash/config -type f -print0 \
            | xargs --null sed -i \
                -e "s|ES_HOST|$ES_HOST|g" \
                -e "s|ES_PORT|$ES_PORT|g"

sleep 40
logstash -f /opt/logstash/config/logstash.conf
