#!/bin/bash -e

FIRST_SECRET_SETUP="${FIRST_SECRET_SETUP:-true}"
SECRET_FILE_NAME="${SECRET_FILE_NAME:-elastic-stack-secrets.yml}"

if [ -f "$SECRET_FILE_NAME" ]; then
	echo "${SECRET_FILE_NAME} exists!" || exit 1
	FIRST_SECRET_SETUP="false"
fi

if [ $FIRST_SECRET_SETUP = "true" ]; then
	echo -n "Configure a NEW secret for Elastic Stack :"
	setSecretForElasticStack='y'
else
	echo -n "Reconfigure a secret for Elastic Stack (y/N)? "
	read -r setSecretForElasticStack
fi

if [ "$setSecretForElasticStack" != "${setSecretForElasticStack#[Yy]}" ]; then

	echo -n "Use HashiCorp Vault for secrets (y/N)? "
	read -r useHashiCorpVaultAnswer

	if [ "$useHashiCorpVaultAnswer" != "${useHashiCorpVaultAnswer#[Yy]}" ]; then
		echo -n "Yes!...now enter a password for "
		read -r -p "Elastic Stack: " -s ELASTIC_STACK_SECRET
		echo -n "$ELASTIC_STACK_SECRET" | vault kv put secret/deep-elastic-stack ELASTIC_STACK_SECRET=- && vault kv get secret/deep-elastic-stack || exit 1
		echo -n "$ELASTIC_STACK_SECRET" >"${SECRET_FILE_NAME}"
		# Execute docker secret for swarm setups.
		vault kv get -field=ELASTIC_STACK_SECRET secret/deep-elastic-stack | docker secret create secrets_yaml -
	else
		echo "No?...Using the default method to ${SECRET_FILE_NAME} "
		read -r -p "Enter a password for logging into Elastic Stack: " -s ELASTIC_STACK_SECRET && echo "${ELASTIC_STACK_SECRET}" >"${SECRET_FILE_NAME}"
		echo -n "$ELASTIC_STACK_SECRET" | docker secret create secrets_yaml -
	fi
fi

### TODO: Add Ansible or another CI environment.
### sudo apt-get update && sudo apt-get install software-properties-common -y
### sudo apt-add-repository ppa:ansible/ansible -y 
### sudo apt-get update && sudo apt-get install ansible -y 

### TODO: Install Docker precursor configuration.  Ansible perhaps?
### DOCKER_COMPOSE_VERSION=$(curl -Ls -o /dev/null -w "%{url_effective}" https://github.com/docker/compose/releases/latest | awk -F / '{print $NF}')
### CURRENT_USER=$(whoami)

# TODO: Execute ansible-playbook
### ansible-playbook ./bootstrap.yml -e docker_compose_version="$DOCKER_COMPOSE_VERSION" -e user="$CURRENT_USER"

### Deploy Stack
echo -n "Deploy this Elastic Stack (y/N)? "
read -r deployElasticStackAnswer

if [ "$deployElasticStackAnswer" != "${deployElasticStackAnswer#[Yy]}" ]; then
	echo -n "Executing: docker-compose up -d --force-recreate --build "
	docker-compose up -d --force-recreate --build && echo || echo "Failed!  Is Docker Compose installed?" && exit 5
else
	echo "Not deploying then."
fi