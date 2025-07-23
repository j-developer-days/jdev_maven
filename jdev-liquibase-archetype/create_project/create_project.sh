#!/bin/bash
clear

./clean_install.sh

./remove_project.sh

#mvn archetype:generate

mvn -X archetype:generate \
  -DarchetypeGroupId=com.jdev \
  -DarchetypeArtifactId=jdev-liquibase-archetype \
  -DarchetypeVersion=1-14.07.2025-j17 \
  -DgroupId=com.jdev \
  -DartifactId=test \
  -Dversion=1-23.07.2025 \

echo '-----------------------------------------------------'
ls -la