ARG ELASTIC_STACK_VERSION
ARG BUILD_NUMBER

# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:${ELASTIC_STACK_VERSION} as deep-elasticsearch
RUN echo "Build number: $BUILD_NUMBER" 

WORKDIR /usr/share/elasticsearch
COPY --chown=1000:0 /config config/
COPY --chown=0:0 bin/limits.d/20-nproc.conf /etc/security/limits.d/20-nproc.conf

COPY --chown=1000:0 bin/docker-entrypoint-fix.sh /usr/local/bin/docker-entrypoint-fix.sh
RUN chgrp 0 /usr/local/bin/docker-entrypoint-fix.sh && \
    chmod g=u /etc/passwd && \
    chmod 0775 /usr/local/bin/docker-entrypoint-fix.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint-fix.sh"]
CMD ["eswrapper"]

# TODO: Add elasticsearch plugin abilities