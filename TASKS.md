Tasks
=====

Project implementation tasks.

-	[ ] Configuring Elasticsearch with Docker.
	-	[ ] Documentation [https://www.elastic.co/guide/en/elasticsearch/reference/6.4/docker.html](https://www.elastic.co/guide/en/elasticsearch/reference/6.4/docker.html)
-	[ ] Security setup.
	-	[ ] Password setup for built-in users. [https://www.elastic.co/guide/en/elastic-stack-overview/6.4/built-in-users.html#bootstrap-elastic-passwords](https://www.elastic.co/guide/en/elastic-stack-overview/6.4/built-in-users.html#bootstrap-elastic-passwords)
	-	[ ] Encrypting communications in an Elasticsearch Docker container. [https://www.elastic.co/guide/en/elasticsearch/reference/6.4/configuring-tls-docker.html](https://www.elastic.co/guide/en/elasticsearch/reference/6.4/configuring-tls-docker.html)
	-	[ ] Elasticsearch secure settings. [https://www.elastic.co/guide/en/elasticsearch/reference/current/secure-settings.html](https://www.elastic.co/guide/en/elasticsearch/reference/current/secure-settings.html)
	-	[ ] Add secret rotation on updates.
	-	[ ] Using HashiCorp Vault [https://www.vaultproject.io/docs/internals/rotation.html](https://www.vaultproject.io/docs/internals/rotation.html)
	-	[ ] Docker Swarm Secrets [swarm/secrets/rotate-a-secret](https://docs.docker.com/engine/swarm/secrets/#example-rotate-a-secret)
- [ ] Check into using Standard-Version for releases.  i.e. Add this to the package.json under scripts: `"release": "standard-version",
    "postrelease": "git push --follow-tags origin master",`
