#!/bin/bash

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Starting Elasticsearch"

#FIXME
sh -c 'plugin -i elasticsearch/license/latest || true \
                && plugin -i elasticsearch/marvel/latest || true \
                && plugin -i elasticsearch/watcher/latest || true \
                && elasticsearch'
