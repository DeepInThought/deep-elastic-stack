#!/bin/bash -e
### TODO: See production best practices at https://www.elastic.co/guide/en/elasticsearch/reference/6.4/docker.html
### Notes: Also see https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_notes_for_production_use_and_defaults

### docker build --build-arg ELASTIC_STACK_VERSION=6.4.2 --build-arg BUILD_NUMBER=0.0.3 -t deepinthought/deep-elasticsearch . ###