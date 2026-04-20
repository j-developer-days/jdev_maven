#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

clear

bash "${SCRIPT_DIR}"clean_install.sh

bash "${SCRIPT_DIR}"remove_project.sh

#mvn archetype:generate

mvn -X archetype:generate \
  -DarchetypeGroupId=com.jdev \
  -DarchetypeArtifactId=jdev-liquibase-archetype \
  -DarchetypeVersion=1.1.3-20.04.2026-j17 \
  -DgroupId=com.jdev \
  -DartifactId=test \
  -Dversion=2-20.04.2026 \

echo '-----------------------------------------------------'
ls -la