#!/bin/bash -e

# Insert password to secrets.env
read -r -p "Enter a password for logging into Elasticsearch and Kibana: " -s ELASTIC_STACK_SECRET
echo "${ELASTIC_STACK_SECRET}" > secrets.env
export ES_PASSWORD=${ELASTIC_STACK_SECRET}

# Execute docker secret for swarm setups.
# echo -n "$ELASTIC_STACK_SECRET" | docker secret create ELASTIC_STACK_SECRET -

# TODO: Add bootstrap
#-------------------------
# BOOTSTRAP ANSIBLE
#-------------------------
# sudo apt-get update && sudo apt-get install software-properties-common -y
# sudo apt-add-repository ppa:ansible/ansible -y
# sudo apt-get update && sudo apt-get install ansible -y

# TODO: Install Docker 
#-------------------------
# ANSIBLE INSTALL DOCKER
#-------------------------
# DOCKER_COMPOSE_VERSION=$(curl -Ls -o /dev/null -w "%{url_effective}" https://github.com/docker/compose/releases/latest | awk -F / '{print $NF}')
# CURRENT_USER=$(whoami)

# TODO: Execute ansible-playbook 
# ansible-playbook ./bootstrap.yml -e docker_compose_version="$DOCKER_COMPOSE_VERSION" -e user="$CURRENT_USER"

#-------------------------
# DEPLOY THE ELASTIC STACK
#-------------------------
docker-compose up -d --force-recreate