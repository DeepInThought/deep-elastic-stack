# Deep Elastic Stack

A custom Elastic Stack for DeepIT.

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

## Tasks

Project task list can be found at [TASKS.md](TASKS.md).

## Elasticsearch Setup

All files are located at the [elasticsearch](elasticsearch/README.md) folder.

## Kibana Setup

All files are located at the [kibana](kibana/README.md) folder.

## Logstash Setup

All files are located at the [logstash](logstash/README.md) folder.

## TLS Setup

Under the [tls-setup](tls-setup/README.md) folder you will see the setup instructions.

### Deep Inspirations

A correlated list of inspirations for project vision.

- [elastic/elasticsearch-docker](https://github.com/elastic/elasticsearch-docker)
- [elastic/quick-deploy](https://github.com/elastic/quick-deploy.git)
- Semantic Versioning provided by [commitizen](http://commitizen.github.io/cz-cli/) and accessible via `git-cz`.
  - Also using [vscode-commitizen](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-commitizen) addon for commitizen: `ctrl+shift+p` and type `conventional commit` for fast access.
  - Using the [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog) for now.
    - Also, utilizing the [conventional-changelog-cli](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-cli) and can be utilized via `conventional-changelog --present eslint --infile CHANGELOG.md --same-file -release 0` **If 0, the whole changelog will be regenerated and the outfile will be overwritten!**

#### About DeepIT

Please see [README.deepIT.md](README.deepIT.md) for information about [DeepInThought](https://github.com/DeepInThought).