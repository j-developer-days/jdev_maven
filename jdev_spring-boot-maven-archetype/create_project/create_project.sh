#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

clear

mvn --file "${SCRIPT_DIR}"../pom.xml -U clean install

bash "${SCRIPT_DIR}"remove_project.sh

#mvn archetype:generate

mvn -X archetype:generate \
  -DarchetypeGroupId=com.jdev \
  -DarchetypeArtifactId=jdev-spring-boot-archetype \
  -DarchetypeVersion=2.3-22.07.2026-j17 \
  -DgroupId=com.jdev \
  -DartifactId=test \
  -Dversion=2-20.04.2026 \
  -DportNumber=10025 \
  -DcontextPath=/test

echo '-----------------------------------------------------'
ls -la