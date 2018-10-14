#!/bin/bash -e
set -x

source .env || CONTAINER_OS=${CONTAINER_OS:-CentOS}

if [[ "$CONTAINER_OS" == "Ubuntu" ]]; then
    mkdir -p elasticsearch/bin/elasticsearch.service.d/
	### Below for Ubuntu and systemd setups ###
	### https://github.com/elastic/elasticsearch/blob/master/distribution/packages/src/common/systemd/elasticsearch.service ###
	echo \
    "# Filename: /etc/systemd/system/elasticsearch.service.d/override.conf
    # Info: https://github.com/elastic/elasticsearch/blob/master/distribution/packages/src/common/systemd/elasticsearch.service
    [Service]
    LimitMEMLOCK=infinity" >elasticsearch/bin/elasticsearch.service.d/override.conf
fi

if [[ "$CONTAINER_OS" == "CentOS" ]]; then
### Insert override for ulimit -a ###
mkdir -p elasticsearch/bin/limits.d
echo \
"# Default limit for number of user's processes to prevent
# accidental fork bombs.
# See rhbz #432903 for reasoning.
# Place in /etc/security/limits.d/20-nproc.conf

*          soft    nproc     4096
root       soft    nproc     unlimited
elasticsearch  -  nofile  65536" >elasticsearch/bin//limits.d/20-nproc.conf

fi

#docker build --rm --build-arg BUILD_NUMBER=0.0.4 --build-arg ELASTIC_STACK_VERSION=6.4.2 -f "elasticsearch/Dockerfile" -t deepinthought/deep-elasticsearch:latest elasticsearch/
#docker run -it --rm --name deep-elasticsearch -v "$PWD/elasticsearch/config:/usr/share/elasticsearch/config" docker.elastic.co/elasticsearch/elasticsearch-oss:"${ELASTIC_STACK_VERSION}"
