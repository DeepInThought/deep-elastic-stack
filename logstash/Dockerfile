ARG ELASTIC_STACK_VERSION
ARG BUILD_NUMBER

# https://www.docker.elastic.co/#logstash
FROM docker.elastic.co/logstash/logstash-oss:${ELASTIC_STACK_VERSION}
RUN echo "Build number: $BUILD_NUMBER"

# TODO: Add logstash plugin abilities
